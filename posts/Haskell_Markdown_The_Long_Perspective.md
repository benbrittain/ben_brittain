---
title: Haskell, Markdown, and taking the long perspective
date: 2013-02-08
---

As I was building this site, my friends would say things like "markdown, \**scoff* \* really?" or
"the Internet doesn't have Types!" As an inauguaral post on this new blog an explanation of why I chose these technologies may be wise.

So Why Haskell?
-------------

The code that generates the main portion of the site is written in [Haskell](http://haskell.org).
While Haskell certainly isn't the oldest computer language out there, it has a long and well established history of quality community support and code quality.
I also tend to enjoy writting Haskell more than I do most other languages.
However, the real reason behind using Haskell is [Hakyll](http://jaspervdj.be/hakyll/).
Hakyll is vaguely based on Jekyll a very popular ruby library. When I can avoid it, I prefer to
avoid dynamically typed languages. Hakyll is at least as flexible as Jekyll and feels very robust
and safe.


Why Markdown?
-------------
The beauty of Markdown lies in how simple it is on the surface. It is human readable even without the processing
done by [pandoc](http://johnmacfarlane.net/pandoc/) (some more fantastic haskell software) and it feels like I
am writting a simple text document. It's usage does not inhibit the "creative process" and it isn't
dependent upon a specific development environment.

The Long Perspective
--------------------
The choices for Markdown and Haskell are symptoms of my attempt to embrace a long-term
perspective. The idea is that we should begin to think about the future and not just 5 years or 10 years out, but greater than even 50 years. I don't doubt, baring any large disasters on a personal or global scale,
I will live another 50 years, potentially much longer. Most everything on the internet tends to be relativly
transient and most all of the decisions made in choosing technology for my site reflects an attempt to
mitigate that aspect of the web.

There are currently many content hosters out there that target the broad category of internet writtings, and they
certainly have an appeal. There is no way my site is ever going to look as good as
[Medium](https://medium.com/) or have the social aspects of something like [Google+](plus.google.com).
Despite the benifits of these content networks, they are "Walled Gardens" with more
often than not poor "Intellectual Property" policies, they also rarely have an ability to export the
content you have created. This not only constrains freedom but also inherintly limits the tinkering and innovation that would otherwise occur. This is an unacceptable tradeoff.

As a counter point, my current setup is a static site generator that generates 100% web standard HTML/CSS/JS from the
simple templates provided. Assuming that every single copy of hakyll was somehow destroyed, unlikly due to it's liberal licensing and relience upon a DVCS, it's functionality could be without too much difficulty, replicated.

The content is also "licensed" under [Creative Commons 0](http://creativecommons.org/publicdomain/zero/1.0/)
which besides from freeing my "IP" from statist control, helps ensure that it will be replicated. It
is also easy to replicate since the content, as well as the source code, is managed by
[Git](http://git-scm.com/) a Distributed Version Control System that replicates the code and
prevents it from being vulnerable in a single centralized location.

Potentially, this site may continue being updated and tweaked for many years to come. Even if I one
day get bored and rewrite the whole site, which in entirely likely, the usage of open standards and
simple content formats will allow the content to survive. The lastingness and enduringness of the
data is what matters.


I highly recommend looking at (and supporting!) both the [Long Now
Foundation](http://longnow.org) and the [Internet Archive](http://archive.org/)
