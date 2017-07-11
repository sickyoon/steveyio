+++
title = "Add my SSH key to remote host authorized keys"
description = "Supercharge your development machine"
date = 2017-04-20T16:04:56-04:00
categories = ["devops"]
tags = ["ssh", "devops"]
+++

Here is handy command to add my SSH key to remote host authorized keys.

```
cat ~/.ssh/id_rsa.pub | ssh <USER>@<REMOTE_HOST> "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys"
```

