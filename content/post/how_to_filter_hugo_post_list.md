+++
Description = "How to filter Hugo post list"
Tags = [
  "hugo",
  "golang",
]
Categories = [
  "hugo",
  "blog",
]
date = "2016-12-20T19:34:32+09:00"
title = "How to filter Hugo post list"
thumbnail = "https://gohugo.io/img/hugo.png"
author = "Sick Yoon"
+++

Hugo is a fast static site generator based on Go language. <br>
It has wide variety of themes available on its [theme site].
This blog uses [hugo-redlounge] theme for instance.
Often times, you need to add custom pages and want to filter them out from your main page.
For example, "about" page of this blog does not appear on the main list.
Thankfully, Hugo documentation has [template functions] section which contains commonly used functions to customize your hugo themes.

## Type Parameter

There is a parameter called `Type`.
When you create a new blog post using `hugo new post/new-blog-post.md`, new file `new-blog-post.md` is created with `type` automatically set to `post`.
However when you create a new post using `hugo new about.md`, then new page is created with `type` set to `page`.
Therefore, in order to hide everything but *blog posts*, we only need to filter the list to show only `post` type.

## Code 

Here is sample code for displaying a list of all blog posts.
```html
{{ $Site := .Site }}
{{ range .Site.Pages }}
<h1 class="post-title">
  <a href="{{ .RelPermalink }}">{{ .Title }}</a>
</h1>
{{ end }}
```

We will add filter to display only `post` type pages.
```html
{{ $Site := .Site }}
{{ range where .Site.Pages "Type" "post" }}
<h1 class="post-title">
  <a href="{{ .RelPermalink }}">{{ .Title }}</a>
</h1>
{{ end }}
```

[theme site]: https://themes.gohugo.io/
[hugo-redlounge]: https://github.com/tmaiaroto/hugo-redlounge
[template functions]: https://gohugo.io/templates/functions/


