# `mq3.botlib.be_aas_file.FileInfo`

[Home](README.md) · [Source file](File-src-mq3-botlib-be-aas-file-ml-8892360.md)

<a id="struct-struct-mq3-botlib-be-aas-file-fileinfo-struct-fileinfo-src-mq3-botlib-be-aas-file-ml-880170279"></a>
## FileInfo

```ml
struct FileInfo
```

`FileInfo` record for be aas file, containing `version`, `numVertexes`, `numPlanes`, `numEdges` and `edgeIndexSize` and related fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_aas_file.ml#L68)

## Members

<a id="field-field-mq3-botlib-be-aas-file-fileinfo-edgeindexsize-edgeindexsize-src-mq3-botlib-be-aas-file-ml-1679278519"></a>
### edgeIndexSize

```ml
edgeIndexSize
```

Number of signed edge references in the AAS edge-index lump.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_aas_file.ml#L78)

<a id="field-field-mq3-botlib-be-aas-file-fileinfo-faceindexsize-faceindexsize-src-mq3-botlib-be-aas-file-ml-2006501215"></a>
### faceIndexSize

```ml
faceIndexSize
```

Number of signed face references in the AAS face-index lump.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_aas_file.ml#L82)

<a id="field-field-mq3-botlib-be-aas-file-fileinfo-groundedareas-groundedareas-src-mq3-botlib-be-aas-file-ml-731262231"></a>
### groundedAreas

```ml
groundedAreas
```

Number of AAS areas marked as grounded.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_aas_file.ml#L98)

<a id="field-field-mq3-botlib-be-aas-file-fileinfo-numareas-numareas-src-mq3-botlib-be-aas-file-ml-714418279"></a>
### numAreas

```ml
numAreas
```

Number of portal or navigation areas represented by the loaded map.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_aas_file.ml#L84)

<a id="field-field-mq3-botlib-be-aas-file-fileinfo-numareasettings-numareasettings-src-mq3-botlib-be-aas-file-ml-1729636103"></a>
### numAreaSettings

```ml
numAreaSettings
```

Number of area settings represented by this record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_aas_file.ml#L86)

<a id="field-field-mq3-botlib-be-aas-file-fileinfo-numclusters-numclusters-src-mq3-botlib-be-aas-file-ml-1416295739"></a>
### numClusters

```ml
numClusters
```

Number of visibility clusters associated with this entity or map.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_aas_file.ml#L96)

<a id="field-field-mq3-botlib-be-aas-file-fileinfo-numedges-numedges-src-mq3-botlib-be-aas-file-ml-400817575"></a>
### numEdges

```ml
numEdges
```

Number of edge records represented by this face or file inventory.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_aas_file.ml#L76)

<a id="field-field-mq3-botlib-be-aas-file-fileinfo-numfaces-numfaces-src-mq3-botlib-be-aas-file-ml-1076762351"></a>
### numFaces

```ml
numFaces
```

Number of face records represented by this area or file inventory.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_aas_file.ml#L80)

<a id="field-field-mq3-botlib-be-aas-file-fileinfo-numnodes-numnodes-src-mq3-botlib-be-aas-file-ml-1113108001"></a>
### numNodes

```ml
numNodes
```

Number of nodes represented by this record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_aas_file.ml#L90)

<a id="field-field-mq3-botlib-be-aas-file-fileinfo-numplanes-numplanes-src-mq3-botlib-be-aas-file-ml-707481435"></a>
### numPlanes

```ml
numPlanes
```

Number of planes represented by this record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_aas_file.ml#L74)

<a id="field-field-mq3-botlib-be-aas-file-fileinfo-numportals-numportals-src-mq3-botlib-be-aas-file-ml-878824001"></a>
### numPortals

```ml
numPortals
```

Number of cluster portals.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_aas_file.ml#L92)

<a id="field-field-mq3-botlib-be-aas-file-fileinfo-numvertexes-numvertexes-src-mq3-botlib-be-aas-file-ml-1806116255"></a>
### numVertexes

```ml
numVertexes
```

Number of vertexes represented by this record.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_aas_file.ml#L72)

<a id="field-field-mq3-botlib-be-aas-file-fileinfo-portalindexsize-portalindexsize-src-mq3-botlib-be-aas-file-ml-532968243"></a>
### portalIndexSize

```ml
portalIndexSize
```

Number of portal references in the AAS portal-index lump.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_aas_file.ml#L94)

<a id="field-field-mq3-botlib-be-aas-file-fileinfo-reachabilitysize-reachabilitysize-src-mq3-botlib-be-aas-file-ml-878969687"></a>
### reachabilitySize

```ml
reachabilitySize
```

Number of records in the AAS reachability lump.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_aas_file.ml#L88)

<a id="field-field-mq3-botlib-be-aas-file-fileinfo-version-version-src-mq3-botlib-be-aas-file-ml-968936715"></a>
### version

```ml
version
```

AAS file-format version reported by the loaded map.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/main/src/mq3/botlib/be_aas_file.ml#L70)
