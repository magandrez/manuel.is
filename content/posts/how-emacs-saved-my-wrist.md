---
title: "Of how Emacs saved my wrist"
tagline: "A sort of tragicomedy in three acts."
date: 2019-05-21T19:27:00+03:00
---

#### Act 1 -- Perks of the job

As some of you might know, I bring bread to my table writing software. For this, I studied Software Engineering. My studies took rather long, around 7 years, probably due to a mix of laziness and a _peculiar_ educational system in Spain. To develop that opinion alone would account for a whole set of posts, but let me cut it short and say that I got it done (and out of it) at the right time.

It is probably obvious to say, but I will leave it clear now, since it is the root cause behind me writing this post: being a software engineer requires a lot of time interacting with a computer. Interaction (in my case) is mainly done via two devices, a keyboard and a mouse. I guess no surprises there, right? Well, for one of those reasons that makes the Spanish higher education system _peculiar_, one does not spend (in general) as much time in front of a computer during the studies as when one lands, face first, on the job market. I think this is one of the reasons that let my malady pass unadverted, perhaps undeveloped during all those years.

#### Act 2 -- It hurts

Fast forward to May 2016. I was over the moon. I had just started working at my current employer [Digital Goodie](http://www.digitalgoodie.com/) as a backend developer, after a 4 years stint as Salesforce Developer. I would learn the ropes to contribute to an in-house e-commerce product on the making. My tasks would shift, I would start doing even more code, instead of the mix of code and requirements' grooming, typical of the consultancy I worked until then.

As part of the normal procedures, a health check was performed, in which nothing relevant was found. But just couple of months in and I started to feel an intense and constant pain in my right wrist both during working hours, and outside work. After consulting with the doctor, I got a redirect to the physiotherapist, who confirmed my first impressions: the pain was due to my posture at work and if not treated, it could lead to [carpal tunnel syndrome (CTS)](https://en.wikipedia.org/wiki/Carpal_tunnel_syndrome). At first, I blamed my mouse, an old [Mighty Mouse](https://en.wikipedia.org/wiki/Apple_Mighty_Mouse) I bought during my studies. Too flat of a design for my hand shape, quirky middle button, etc, all were to blame. Besides, by the end of the week, after resting during the weekend, my hand would recover well enough to stop me from requesting a sick leave.

So, in light of my (educated) guesses, and with the OK from the physiotherapist, my employer got me a [fancy orthopedic mouse](https://evoluent.com/products/vm4rb/ "Evoluent vertical mouse"). Its main feature is that it is vertical (as opposite to an ordinary mouse) enabling a more comfortable position for my arm and my wrist. It did help, but it was not enough. The pain continued.

#### Act 3 -- Yolo

So it was then when I decided to be more careful with my observations and found that, most of the time, I was not just using the mouse alone, nor the keyboard, **I was switching between mouse and keyboard***. And this was due to the way I carried out my tasks. The blame fell on my choice of _IDE_. Around the time I started at Digital Goodie (back then, Foodie.fm), I was using [TextMate](https://macromates.com/) and, despite not having fancy features like auto-completion, I had already thought of switching to [Atom](https://ide.atom.io/), the new _cool kid_ in town, mainly due to vanity (yes, vanity, only a shiny new community separated those two programs).
 
Throughout my study years I had changed different times the development environment. I did not see that as a problem, in retrospective, I regret it. From [Borland Turbo Pascal](https://en.wikipedia.org/wiki/Turbo_Pascal) to [Eclipse IDE](https://www.eclipse.org/ide/) passing by [notepad++](https://notepad-plus-plus.org/). I did not understand back then that, what I needed was just a plain text editor like [Vim](https://www.vim.org/) or [Emacs](https://www.gnu.org/software/emacs/). Those were familiar to me, sure, but I thought of them as _giant old dinosaurs_ with dead developer communities (funny enough, I did not see the same issue with Eclipse :laughing:)

It was only then when I realised that **I might need to write code with something more keyboard-centric**. Well, d'oh, that idea has been around for over 30 years, the idea behind those editors I thought of as _dinosaurs_ was spot on all along. _Who would have thought that?_

So I had to try to switch to a text editor. If I recall correctly, Vim and Emacs were drafted, and I made my choice solely on the impressions that I got from the embedded walkthrough. Nothing else. The switch was rather slow. I wanted to have a carefully crafted configuration that cattered for _all_ my needs, at the same time I was familiarising with _all_ the [key strokes](https://www.gnu.org/software/emacs/manual/html_node/efaq/Basic-keys.html). I was naive when thinking about it, I learned later that I would never be happy with [my Emacs config](https://github.com/magandrez/.emacs.d) revisiting it again and again and finding bugs every time I would look at it; and sure I would never learn all the key strokes :smiley:

The pain went away as I embraced my now editor for everything. Years of accumulated wisdom won the battle for my editor of choice and did it helping me continue writing code and other things, like this post  :relieved:. 
