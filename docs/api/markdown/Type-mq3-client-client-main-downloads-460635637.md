# `mq3.client.client_main.Downloads`

[Home](README.md) · [Source file](File-src-mq3-client-client-main-ml-798872826.md)

<a id="struct-struct-mq3-client-client-main-downloads-struct-downloads-src-mq3-client-client-main-ml-582696879"></a>
## Downloads

```ml
struct Downloads
```

Stores client main downloads record, including `queue`, `index`, `name`, `tempName`, `restarted`, `completed`.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L131)

## Members

<a id="field-field-mq3-client-client-main-downloads-completed-completed-src-mq3-client-client-main-ml-272531940"></a>
### completed

```ml
completed
```

When constructing this record, `create` supplies `false` for this member. Used by `CL_BeginDownload` and `CL_InitDownloads` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L148)

<a id="field-field-mq3-client-client-main-downloads-index-index-src-mq3-client-client-main-ml-2108608604"></a>
### index

```ml
index
```

When constructing this record, `create` supplies `0` for this member. Used by `CL_NextDownload` and `CL_InitDownloads` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L137)

<a id="field-field-mq3-client-client-main-downloads-name-name-src-mq3-client-client-main-ml-20117382"></a>
### name

```ml
name
```

Virtual filename of the package or file currently being downloaded.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L139)

<a id="field-field-mq3-client-client-main-downloads-queue-queue-src-mq3-client-client-main-ml-1706954068"></a>
### queue

```ml
queue
```

When constructing this record, `create` supplies an empty list for this member. Used by `CL_NextDownload` and `CL_InitDownloads` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L134)

<a id="field-field-mq3-client-client-main-downloads-restarted-restarted-src-mq3-client-client-main-ml-2040737992"></a>
### restarted

```ml
restarted
```

When constructing this record, `create` supplies `false` for this member. Used by `CL_DownloadsComplete` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L145)

<a id="field-field-mq3-client-client-main-downloads-tempname-tempname-src-mq3-client-client-main-ml-887319834"></a>
### tempName

```ml
tempName
```

When constructing this record, `create` supplies an empty string for this member. Used by `CL_BeginDownload` and `CL_DownloadsComplete` during subsequent processing.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/client/client_main.ml#L142)
