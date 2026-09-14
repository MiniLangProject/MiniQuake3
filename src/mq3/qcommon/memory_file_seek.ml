// Copyright (C) 1999-2005 Id Software, Inc.
// SPDX-License-Identifier: GPL-2.0-or-later
// FS_Seek semantics for the in-memory PK3 file handles used by local QVMs.
package mq3.qcommon.memory_file_seek

const FS_SEEK_CUR=0
const FS_SEEK_END=1
const FS_SEEK_SET=2

function seek(files,handle,offset,origin)
  if files==void or handle<=0 or handle>=len(files) then return -1 end if
  cursor=files[handle]
  if cursor==void or cursor.data==void or cursor.offset<0 then return -1 end if
  base=cursor.offset
  if origin==FS_SEEK_END then base=len(cursor.data)
  else if origin==FS_SEEK_SET then base=0
  else if origin!=FS_SEEK_CUR then return error(7474,"invalid FS_Seek origin") end if
  position=base+offset
  // fseek rejects positions before the start but permits positions beyond EOF.
  if position<0 then return -1 end if
  cursor.offset=position;return 0
end function
