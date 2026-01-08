---
title: "Get your headers in shape"
date: 2026-01-08T19:48:34+01:00
---

Today is ~1st of January, and as I write this, the weather
[outside](https://en.wikipedia.org/wiki/%27s-Hertogenbosch) is
dreadful~ 8th of January, and even though the weather outside is fair,
the ice on the streets makes walking outside more _challenging_ than
what I am willing to accept.

It was then that, while browsing away, I stumbled upon a pull request
from fellow programmer and good friend
[aperezdc](https://perezdecastro.org/) against an ominous repo:
[512kb.club](https://github.com/kevquirk/512kb.club). The
[club](https://512kb.club/) is yet-another-plea at designing and
implementing more resource-conscious websites. Be that from the
perspective of sustainability or mere engineering efficiency, I concur
with the open statement:

> The internet has become a bloated mess. Huge JavaScript libraries, countless client-side queries and overly complex frontend frameworks are par for the course these days.

I have therefore raised a PR to join the club, and even though it
ended up [rejected](https://github.com/kevquirk/512kb.club/pull/2112#issuecomment-3718346487)
the effort raised my attention to something I have let to the
defaults of my HTTP server: the security headers.

{{< figure src="winter_landscape.jpeg" title="Pekka Halonen, Winter landscape, 1920. Oil on canvas. EMMA – Espoo Museum of Modern Art. Public domain" alt="Winter landscape painting by Pekka Halonen" class="center">}}

Reading up from [OWASP.org on security
headers](https://cheatsheetseries.owasp.org/cheatsheets/HTTP_Headers_Cheat_Sheet.html#security-headers)
has helped me correct those defaults and end up with a slightly more
secure website.

I learned the hard way that different types of content will require
a different set of security headers, as it is not the same to serve
static content than, say, HTML + JS.

Oh and by the way, I still fully support the effort, go check it out and
join the club to back a more efficient web for all. ✌🏻
