---
title: "OS X, Ruby, OpenSSL, Homebrew and RVM as special guest"
date: 2020-01-13T18:41:37+02:00
tagline: "A weekend story"
---

Scary, uh? Well, it is, but not in the daunting way. More in the nightmare way.

I am an OS X user. I have been for over a decade, and since OS X is a flavour of Unix, and I have been working with those for a good 15 years, I guess you could assign to me the _power user_ label. Surprise! this _title_ did not help.

At the beginning, there were very few choices to incorporate 3rd party software to your Apple machine in a sustained way (that is, reproducible, maintained, etc.) I tinkered with [Macports](https://www.macports.org/), but it didn't convince me and I recall having support for few libraries and few pieces of software (it did not occur to me to check how stable it was, I just wanted new shiny things to play with). 

Then, somewhere around 2010 or 2011, I came across [Homebrew](https://brew.sh/), a package manager built in Ruby. I guess that is the main reason why it was spreading like a wildfire; at that time everybody was writing Ruby (or trying to get away from PHP) and at the same time the community needed specific pieces of software to support their development. I decided to adopt it for that reason alone (yeah, I know, how short-sighted). The amount of libraries and new shiny Open Source software that it was enabling was growing by the day. Already back then I reckon browsing through the forums and seeing the despair with my own eyes. This didn't deter me though.

Fast forward a decade, finished my studies and now using these machines for a living. And there I was, this past Friday, about to wrap up for the weekend ahead. 

For a reason I cannot recall, I needed to upgrade a package installed with brew and I went _berserker_ and issued a `brew upgrade`. All these years suffering system-wide brew upgrades, but it seems that I did not learn my lesson, or that I just forgot from the previous incident with brew. In any case, I went ahead and upgraded a bunch of libraries and pieces of software. At first everything was going alright, but then I tried to command [RSpec](https://rspec.info/) to run specs for me and a mischievous message warned me of the weekend ahead fixing the mess:

```
dyld: Library not loaded: /usr/local/opt/openssl/lib/libssl.1.0.0.dylib
```

I learned few things from the above message and all the tinkering across different Ruby versions. And now, I would like to share it here for you. Or for me, to remember.

If you are a Mac OS X and Homebrew user, chances are that you have installed [OpenSSL](https://www.openssl.org/), either directly or as a dependency of some other package. Recently, [Homebrew removed OpenSSL 1.0](https://github.com/Homebrew/homebrew-core/pull/46876) from their offering, somewhere along this deprecation process, [Homebrew set OpenSSL to be openssl@1.1](https://github.com/Homebrew/homebrew-core/pull/47034) by default, that is, set an alias for whenever a user does `brew install openssl` to install the heir to the throne under `/usr/local/opt/openssl@1.1`, instead of OpenSSL 1.0 (openssl 1.0.0t in my case). In the case of a Ruby development environment setup built using OpenSSL 1.0, issuing a `brew upgrade` will install the version 1.1 of said library and remove the previous version, breaking the environment. More in detail, given a Ruby version with a gemset (a collection of gems) built with the previous version of the SSL library, gems that make use of OpenSSL will expect the library mentioned in the error above, but after the upgrade, OpenSSL will be installed under `/usr/local/opt/openssl@1.1/lib/` instead of `/usr/local/opt/openssl/lib`. 

Newer supported Ruby versions (2.4 and above) _seem_ to work fine with OpenSSL 1.1. This is something I could not confirm from a reliable source, it is more my own experience. Nevertheless, if the Ruby version was built with OpenSSL 1.0, my experience is that it stops working and needs to be re-built, along with the gemsets you have for said Ruby version. But things are not solved that easily.

[Ruby versions below 2.4 don't support OpenSSL 1.1](https://github.com/rbenv/ruby-build/issues/1321#issuecomment-513602520), and _due to reasons_&copy; I need to work with some of those EOL versions. Having a setup with multiple Ruby versions and possibly multiple gemsets per version does not make things easier. For this reason I use [RVM](https://rvm.io/), a Ruby version manager. RVM uses a feature called `autolibs` this feature is enabled by default and it detects whichever package manager you have installed and calls it to fulfill requirements when installing new rubies. This will effectively ask from `brew` to install OpenSSL...which will nowadays be resolved to OpenSSL 1.1, leaving Ruby < 2.4 broken.

The solution I end up implementing was the following:

- Install OpenSSL 1.1 with `brew`. It is the default after all. This will leave libraries under `/usr/local/opt/openssl@1.1/lib`.
- Build and install OpenSSL 1.0 however you like. I did it from source. You can use `brew tap` with [this rbenv repo](https://github.com/rbenv/homebrew-tap), or use `brew extract`. Brew, by default, will not link neither of them because it is a system library already present in OS X and Brew does not mess with those, instead it recommends altering the `$PATH` and make the system find those before it finds the default one (under `/usr/bin/`).
- For Ruby >= 2.4, rebuild all Ruby versions and gemsets. RVM supports this by running `rvm reinstall`, which will rebuild gemsets as well.
- For Ruby < 2.4, remove the Ruby versions, and install them again passing `autolibs=0` and passing the the location of the specific version of the library like `--with-openssl-lib=/usr/local/opt/openssl/lib --with-openssl-include=/usr/local/opt/openssl/include`.

It took me a whole weekend to gather all this knowledge. I hope this might help somebody else, it will probably help my future self.



