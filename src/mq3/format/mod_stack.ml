// SPDX-License-Identifier: GPL-2.0-or-later
// Active game data for the Windows desktop host. Modules are original QVM
// bytecode and use the existing Baseq3 traps and client-state layout.
package mq3.format.mod_stack

import mq3.format.pk3 as pk3
import mq3.vm.interpreter as interpreter
import std.ds.list as lists
import std.fs as fs
import std.string as strings

/// Read Win32 file or directory attributes for format.mod_stack.
/// @param path Null-terminated UTF-16 filesystem path.
/// @returns The file-attribute bitmask, or INVALID_FILE_ATTRIBUTES (0xffffffff) on failure.
extern function fileAttributes(path as wstr) from "kernel32.dll" symbol "GetFileAttributesW" returns u32

/// Host filesystem attribute identifying a directory.
const FILE_ATTRIBUTE_DIRECTORY=0x10
/// Host filesystem attribute identifying a reparse-point entry.
const FILE_ATTRIBUTE_REPARSE_POINT=0x400
/// Sentinel returned when host file attributes cannot be obtained.
const INVALID_ATTRIBUTES=0xffffffff
/// Maximum number of unpacked asset files retained by the filesystem index.
const MAX_LOOSE_FILES=65536
/// Maximum directory nesting depth scanned for unpacked assets.
const MAX_LOOSE_DEPTH=16
/// Maximum QVM program image size accepted by the mod loader, in bytes.
const MAX_QVM_IMAGE=16777216

/// Mount record for format.mod_stack, containing `game`, `dataRoot`, `archive`.
struct Mount
  /// Game directory whose assets are mounted at this stack entry.
  game
  /// Filesystem root used to resolve this game directory.
  dataRoot
  /// PK3 archive mounted at this stack entry.
  archive
end struct

/// Create the format.mod_stack error for `fail` with 7689 and the supplied diagnostic text.
/// @param message Message used in `("Mod: " + message)` and `error(7689, ("Mod: " + message))`.
function fail(message) return error(7689,"Mod: "+message) end function

/// Validate name in format.mod_stack; the normal completion returns `true`.
/// @param name Name used in `len(name)` and `bytes(name)`.
function validName(name)
  if typeof(name)!="string" or len(name)<1 or len(name)>15 then return false end if
  for each ch in bytes(name)
    if not ((ch>=65 and ch<=90) or (ch>=97 and ch<=122) or (ch>=48 and ch<=57) or ch==95 or ch==45) then return false end if
  end for
  return true
end function

/// Apply `mq3.format.mod_stack.fileAttributes` for regular directory in format.mod_stack.
/// @param path Null-terminated UTF-16 filesystem path.
function regularDirectory(path)
  attributes=fileAttributes(path)
  return attributes!=INVALID_ATTRIBUTES and (attributes&FILE_ATTRIBUTE_DIRECTORY)!=0 and (attributes&FILE_ATTRIBUTE_REPARSE_POINT)==0
end function

/// Test scan loose in format.mod_stack; the normal completion returns `true`.
/// @param directory Directory used in `fs.listDir(directory)` and `try(fs.listDir(directory))`.
/// @param prefix Prefix used in `(prefix + name)`.
/// @param depth Depth used in `(depth + 1)` and `(depth < MAX_LOOSE_DEPTH)`.
/// @param entries Record exposing `len`, `add`.
function scanLoose(directory,prefix,depth,entries)
  names=try(fs.listDir(directory));if names is error then return names end if
  for each name in names
    if name[0]=="." then continue end if
    qpath=prefix+name
    if len(bytes(qpath))>=64 then continue end if
    path=fs.joinPath(directory,name);attributes=fileAttributes(path)
    if attributes==INVALID_ATTRIBUTES or (attributes&FILE_ATTRIBUTE_REPARSE_POINT)!=0 then continue end if
    if (attributes&FILE_ATTRIBUTE_DIRECTORY)!=0 then
      if depth<MAX_LOOSE_DEPTH then
        scanned=scanLoose(path,qpath+"/",depth+1,entries);if scanned is error then return scanned end if
      end if
      continue
    end if
    lower=strings.toLowerAscii(name)
    if strings.endsWith(lower,".pk3") or strings.endsWith(lower,".dll") or strings.endsWith(lower,".exe") then continue end if
    size=try(fs.fileSize(path));if size is error then return size end if
    if entries.len()>=MAX_LOOSE_FILES then return fail("too many loose files in "+directory) end if
    entries.add(pk3.looseEntry(qpath,path,size))
  end for
  return true
end function

/// Test verify packages in format.mod_stack; the normal completion returns `true`.
/// @param directory Directory used in `fs.joinPath(directory, name)` and `fileAttributes(fs.joinPath(directory, name))`.
/// @param names Sequence traversed as `name` by the loop in `verifyPackages`.
function verifyPackages(directory,names)
  for each name in names
    if not strings.endsWith(strings.toLowerAscii(name),".pk3") then continue end if
    attributes=fileAttributes(fs.joinPath(directory,name))
    if attributes!=INVALID_ATTRIBUTES and (attributes&FILE_ATTRIBUTE_REPARSE_POINT)!=0 then return fail("package must be a regular file: "+name) end if
  end for
  return true
end function

/// Test verify modules in format.mod_stack; the normal completion returns `true`.
/// @param gameArchive Archive passed as `archive` to `mq3.format.pk3.findEntry`.
/// @param names Sequence traversed as `name` by the loop in `verifyModules`.
function verifyModules(gameArchive,names)
  for each moduleName in ["ui","cgame","qagame"]
    path="vm/"+moduleName+".qvm";entry=pk3.findEntry(gameArchive,path)
    if entry==void then
      for each name in names
        lower=strings.toLowerAscii(name)
        if strings.startsWith(lower,moduleName) and strings.endsWith(lower,".dll") then return fail("native module requires a compatible QVM: "+name) end if
      end for
      continue
    end if
    if entry.size>MAX_QVM_IMAGE then return fail("QVM image exceeds module size limit: "+path) end if
    data=try(pk3.readEntry(gameArchive,entry))
    if data is error then return fail("cannot read QVM: "+path) end if
    // Validate the image header before replacing the session. The interpreter
    // checks the bytecode as it loads the module in the new session.
    if try(interpreter.imageLayout(data)) is error then return fail("unsupported or damaged QVM: "+path) end if
  end for
  return true
end function

/// Compute mount in format.mod_stack; the normal completion returns `Mount(requestedGame, directory, pk3.overlay(directory, baseArchive, gameArchive))`.
/// @param baseArchive Initial `archive` field stored in the returned or constructed `mq3.format.mod_stack.Mount` record.
/// @param installRoot Install root used in `(installRoot == "")` and `fs.joinPath(installRoot, "baseq3")`.
/// @param requestedGame Name passed as `name` to `mq3.format.mod_stack.validName`.
function mount(baseArchive,installRoot,requestedGame)
  if baseArchive==void or installRoot=="" or typeof(requestedGame)!="string" then return fail("base archive and install directory are required") end if
  if requestedGame=="" or stringEqualsIgnoreCaseAscii(requestedGame,"baseq3") then return Mount("",fs.joinPath(installRoot,"baseq3"),baseArchive) end if
  if not validName(requestedGame) then return fail("invalid game directory name") end if
  directory=fs.joinPath(installRoot,requestedGame)
  if not regularDirectory(directory) then return fail("game directory not found: "+requestedGame) end if
  names=try(fs.listDir(directory));if names is error then return names end if
  verified=verifyPackages(directory,names);if verified is error then return verified end if
  packages=try(pk3.openPackages(directory,false));if packages is error then return packages end if
  loose=lists.List.withCapacity(32)
  result=scanLoose(directory,"",0,loose);if result is error then return result end if
  gameArchive=pk3.withLoose(directory,packages,loose.toArray())
  verified=verifyModules(gameArchive,names);if verified is error then return verified end if
  return Mount(requestedGame,directory,pk3.overlay(directory,baseArchive,gameArchive))
end function
