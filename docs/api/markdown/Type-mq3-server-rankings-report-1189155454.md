# `mq3.server.rankings.Report`

[Home](README.md) · [Source file](File-src-mq3-server-rankings-ml-1338987992.md)

<a id="struct-struct-mq3-server-rankings-report-struct-report-src-mq3-server-rankings-ml-116798905"></a>
## Report

```ml
struct Report
```

Report record for server.rankings, containing `text`, `index1`, `index2`, `key`, `intValue`, `strValue`, and 5 further fields.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L114)

## Members

<a id="field-field-mq3-server-rankings-report-accum-accum-src-mq3-server-rankings-ml-1791506951"></a>
### accum

```ml
accum
```

True when the service should accumulate rather than replace the statistic.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L128)

<a id="field-field-mq3-server-rankings-report-context-context-src-mq3-server-rankings-ml-1650108351"></a>
### context

```ml
context
```

Ranking-service context handle receiving this accumulated match-statistic report.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L130)

<a id="field-field-mq3-server-rankings-report-index1-index1-src-mq3-server-rankings-ml-1103184433"></a>
### index1

```ml
index1
```

Local slot of the first player associated with the reported statistic.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L118)

<a id="field-field-mq3-server-rankings-report-index2-index2-src-mq3-server-rankings-ml-451926783"></a>
### index2

```ml
index2
```

Local slot of the second player associated with the reported statistic.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L120)

<a id="field-field-mq3-server-rankings-report-intvalue-intvalue-src-mq3-server-rankings-ml-1202763535"></a>
### intValue

```ml
intValue
```

Integer value reported for the statistic.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L124)

<a id="field-field-mq3-server-rankings-report-key-key-src-mq3-server-rankings-ml-829167219"></a>
### key

```ml
key
```

Statistic identifier used by the ranking service.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L122)

<a id="field-field-mq3-server-rankings-report-match-match-src-mq3-server-rankings-ml-1840663935"></a>
### match

```ml
match
```

Ranking-service match handle receiving the report.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L132)

<a id="field-field-mq3-server-rankings-report-strvalue-strvalue-src-mq3-server-rankings-ml-1383128423"></a>
### strValue

```ml
strValue
```

Text value reported for the statistic.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L126)

<a id="field-field-mq3-server-rankings-report-text-text-src-mq3-server-rankings-ml-1680422437"></a>
### text

```ml
text
```

Textual diagnostic or report data sent to the ranking backend.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L116)

<a id="field-field-mq3-server-rankings-report-user1-user1-src-mq3-server-rankings-ml-1851439999"></a>
### user1

```ml
user1
```

Service user identifier for the first reported player.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L134)

<a id="field-field-mq3-server-rankings-report-user2-user2-src-mq3-server-rankings-ml-1457467739"></a>
### user2

```ml
user2
```

Service user identifier for the second reported player.


[View source](https://github.com/MiniLangProject/MiniQuake3/blob/master/src/mq3/server/rankings.ml#L136)
