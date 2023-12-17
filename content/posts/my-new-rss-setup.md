---
title: "My New Rss Setup"
tagline: "And some history on the side"
date: 2021-01-11T08:35:07+02:00
---

I was not _there_ when the first specification of RSS came out in March 15th 1999. But as soon as I got my hands on a steady internet connection, I got hooked at having the information I wanted _delivered to me_ as soon as it came out. I recall being on my first shared student apartment featuring lovable people and an internet connection measured in <abbr title="Kilobytes per second">kB/s</abbr>, not <abbr title="Megabytes per second">MB/s</abbr>. I was interested in the development of that new browser that was going to revolutionize the world: _Phoenix_, later known as _Mozilla Firefox_. But also addicted to the — nowadays defunct — [Spanish Slashdot](https://web.archive.org/web/20040819080505/http://barrapunto.com/ "Barrapunto.com as seen with Wayback Machine"); the Galician blog community known as [blogomillo](https://gl.wikipedia.org/wiki/Blogomillo) and some other local alternative news sites like [Vieiros](https://www.vieiros.com/). All of this information could come to me, instead me going after it every time, thanks to syndication standards such as [RSS](https://en.wikipedia.org/wiki/RSS "RSS definition in the Wikipedia") and [Atom](https://en.wikipedia.org/wiki/Atom_(Web_standard) "Atom (web standard) in the Wikipedia").

{{< figure src="/image/rss_feed_icon.png" title="RSS logo, licensed under Mozilla Public License Version 1.1 (MPL)" alt="RSS logo">}}

I must have started with a stand alone client like [Sage](http://sagerss.com/ "Sage is a lightweight RSS and Atom feed reader extension for Mozilla Firefox") or something of the sort, then moved to Google Reader and after it was [killed in 2013](https://killedbygoogle.com/ "killedbygoogle.com") I found myself pretty orphan of a good client, and relied in forgettable browser plugins.

Few years ago I decided to put some money in tinkering and bought myself some space on the internet — you are seeing part of it —. Apart from some personal projects and other shenanigans, I decided I would setup something to read feeds. I had two options:

1. Make a mess of the server and install a bunch of packages to get a functioning RSS server, something like [TT-RSS](https://tt-rss.org).

2. Just install a client and SSH into the machine to use it.

The first option had many _pros_, like being able to see the feeds from my phone. So I went for it…just to leave it aside few weeks later even though it had all the bells and whistles. I discovered all I wanted was my own reading time not just carving some time while commuting to read half of an entry before jumping into a metro. So I started to look for minimalist clients that would require me to actively set time aside and sit to read the feeds. The second, more minimal option looked better now. Then I found the perfect candidate: [newsboat](https://newsboat.org/ "Newsboat is an RSS/Atom feed reader for the text console"). Newsboat was and still is perfect in many ways. It is simple, handling feeds is editing a plain text file, it is fast and it immerses the user into the reading experience. I chose it also because, due to career shifts, I was spending more and more time in front of the terminal, so it felt more _natural_.

Fast forward few years and I got myself into the garden-universe that is Emacs for [reasons I explained elsewhere](https://manuel.is/posts/how-emacs-saved-my-wrist/ "manuel.is -- Of how Emacs saved my wrist"). Emacs is not an <abbr title="Integrated Development Environment">IDE</abbr> it is the [kitchen sink](https://xkcd.com/378/ "XKCD: Real Programmers"). But for some reason, I refrained from setting up any RSS client on my configuration. It was a change on my environment, dropping iTerm, ZSH — all Mac OS X in short —, that got me closer to this idea; I could no longer open URLs by clicking on my terminal emulator — in hindsight a bad idea, as it might be a security issue —, so I decided to give a go to [elfeed](https://github.com/skeeto/elfeed "Elfeed Emacs Web Feed Reader"). And oh boy!, do I like it. Now I have another experience integrated in my environment, alongside mail client, multi-purpose programming environment, blogging tool, etc. My configuration for elfeed is as follows:

```
(global-set-key (kbd "C-c e") 'elfeed)

(use-package elfeed
  :ensure t
  :bind (:map elfeed-search-mode-map
   ("m" . elfeed-toggle-star)))

(use-package elfeed-goodies
  :ensure t
  :after elfeed
  :config
  (elfeed-goodies/setup)
  (setq elfeed-goodies/entry-pane-position 'bottom
        elfeed-goodies/switch-to-entry nil
        elfeed-goodies/feed-source-column-width 25
        elfeed-goodies/tag-column-width 27))

(use-package elfeed-org
  :ensure t
  :after elfeed
  :config
  (elfeed-org)
  (setq rmh-elfeed-org-files (list "~/feeds/rss.org")))

(use-package elfeed-dashboard
  :after elfeed
  :ensure t
  :config
  (setq elfeed-dashboard-file "~/feeds/dashboard.org")
  ;; update feed counts on elfeed-quit
  (advice-add 'elfeed-search-quit-window :after #'elfeed-dashboard-update-links))
```

This gives me a dashboard from where to glance at the feed counts, the RSS functionality nicely integrated with Emacs (i.e. n for next, p for prior, s to invoke the search filter, etc); some positioning and tweaks made with elfeed-goodies and lastly the ability to manage my feeds in org mode files with elfeed-org, making it dead simple to share and version. My [feeds are available in Github](https://github.com/magandrez/feeds/blob/master/rss.org "magandrez/feeds repo in Github"), by the way.

I chose to write about all this precisely today, 11th of January, because it is a rather sad, but worth remembering date. **Today marks 8 years without Aaron Swartz**. Aaron was a wickedly talented guy, two years my junior that accomplished more than many people do during their entire lifetime. He fought for open access to information (see [United States v Aaron Swartz](https://en.wikipedia.org/wiki/Aaron_Swartz#United_States_v._Aaron_Swartz_case "Wikipedia entry about Aaron linked at the section on the lawsuit against the United States for the open access to research papers")); collaborated with Wikipedia becoming a [voice of dissent against Jimmy Wales](http://www.aaronsw.com/weblog/whowriteswikipedia "Who Writes Wikipedia? the seminal study by Aaron Swartz arguing the soul of Wikipedia are the contributors, not the editors"); got his hands dirty as a campaigner for [Stop Online Piracy Act (SOPA)](https://en.wikipedia.org/wiki/Stop_Online_Piracy_Act "Wikipedia entry on SOPA"); created a collaborative online library — Theinfo.org — at 13; became core contributor to the RSS working group defining the first standard for the technology at age 14 (!); he contributed to the [Markdown specification](https://daringfireball.net/projects/markdown/ "Markdown spec at daringfireball.net"); [helped Lessig architect Creative Commons](https://creativecommons.org/2013/01/12/remembering-aaron-swartz/ "Creative Commons post remembering Aaron on the day after he committed suicide"); and was original founder and coder of [web.py](https://webpy.org/ "web.py framework") the engine behind [Reddit](https://www.reddit.com/ "reddit: the front page of the internet"); the list goes on.

{{< figure src="/image/Aaron_Swartz_profile.jpg" title="Aaron Swartz at a Creative Commons event. Fred Benenson, 13th December 2008. Licensed under CC BY 2.0" alt="Image of Aaron Swartz">}}

Above all, Aaron was an empathic person with a huge heart geared towards the [common good](https://en.wikipedia.org/wiki/Commons "Wikipedia entry on the commons"). Being cornered by lawyers in the case for open access to research publications, he committed suicide 8 years ago today.

We must keep remembering Aaron. Take your time to browse through [his writings](http://www.aaronsw.com/weblog/whowriteswikipedia "aaronsw.com") posted in his website, or get your hands on a copy of [“The Boy Who Could Change the World: The Writings of Aaron Swartz”](https://www.goodreads.com/book/show/23258925-the-boy-who-could-change-the-world "Goodreads entry on Aaron's posthumous book"), a posthumous collection of his writings introduced by Lawrence Lessig.

P.S.: If you are interested in following this website, here is a link to the [RSS feed for manuel.is](https://manuel.is/posts/index.xml "rss feed for this website")

EDIT Mar 8: Minor edits

EDIT Dec 17, 2023: Updated `<figure>` elements to include `alt` attribute.
