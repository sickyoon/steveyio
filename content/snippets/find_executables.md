+++
title = "Find executable files in linux"
description = "Find executable files in linux"
date = "2018-02-26T01:33:04+09:00"
categories = ["commands"]
tags = ["linux"]
hide = true
+++


```
find . -maxdepth 1 -perm -111 -type f
```
