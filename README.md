# Ground Control - UI

This repo holds the Web UI part of [Ground
Control](https://github.com/jondot/groundcontrol).

You should use this if you want to extend / change / contribute to the
UI. Otherwise, feel free to ignore and use `groundcontrol` as-is.


##  Development

The tool chain is node.js based:

* Bower for client-side package management
* npm for dependencies
* grunt for build


`grunt` has its quirks, but I took an educated guess as to what kind of
toolset would exist on your machine. 

In this case I've learnt that not all people have Ruby installed, and most client-side devs already use
Grunt (as opposed to `asset-pipeline` which I love to use).

## Quick start

You should be able to run this (it is preferable that you have grunt
installed via `npm install grunt-cli -g` but YMMV).

```
$ npm install && bower install
$ grunt server
```

You should be aware that these components are used:

* D3/rickshaw for graphing
* Handlebars + jQuery for templating
* Sass (scss)
* + Others (look in `bower.json`)

Happy hacking!



# Contributing

Fork, implement, add tests, pull request, get my everlasting thanks and a respectable place here :).

# Copyright

Copyright (c) 2013 [Dotan Nahum](http://gplus.to/dotan) [@jondot](http://twitter.com/jondot). See MIT-LICENSE for further details.
