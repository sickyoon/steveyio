+++
title = "How to deploy letsencrypt-ready dockerized haproxy using Ansible"
description = "Dockerized letsencrypt-ready HAProxy using Ansible"
date = ""
categories = ["devops"]
tags = ["ansible", "docker", "haproxy", "certbot"]
+++

Ansible is configuration automation tool that does not require client like Chef. You only need Python running on the server (which comes with most linux distribution) and everything is done through SSH. Here, I am going to show you how to write ansible yaml file to deploy dockerized HAProxy with letsencrypt support.

There are a number of ways to verify your domain with letsencrypt. Most common (recommended) way is to expose letsencrypt endpoint on your server. Another popular way is to use DNS. Unfortunately, not every domain name provider provides an API to configure your DNS. I am using Namecheap which does not provide API unless you own multiple domain names.

In order to use SSL certificate with HAProxy, it needs to be put into HAProxy configuration. 