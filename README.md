xscreensaver-text-toys
======================

Some fun little scripts to generate text, which can be plugged in with certain
xscreensaver hacks. 

todos
-----

Provide todorunner.sh with an array of directories containing code you've written. 
These will be searched recursively for source code files containing shameful tokens
like **TODO**, **FIXME**, and **XXX**, and the corresponding lines will be printed.

I recommend being careful to avoid accidentally including directories containing 
external libraries - this is meant to be a showcase of your *own* shortcomings.

Source extensions and naughty words can be customized in todos.sh. You may also 
want to fiddle with the params passed to grep (for instance, you may want case
insensivity, or more or fewer lines of context).

The command to enter for the Program field in `screensaver-demo` is:

    bash /<path>/<to>/todos.sh <sourcedirectory>...

Alternatively, you might like to put a space-separated list of source directories
in a file somewhere and use a command like

    cat /<path>/<to>/mysources.txt | xargs bash /<path>/<to>/todos.sh

(I really can't think of a better way to do this...)

Requirements
============

These scripts work with the xscreensaver library - the most widely used screensaver
library for linux distributions. A good bet for getting it if you don't have it 
already is
    
    apt-get install xscreensaver

By default, xscreensaver doesn't come with many (any?) screensavers that play with
text. To get some, try:

    apt-get install xscreensaver-data-extra xscreensaver-gl-extra

todos likes to have the `rl` command...

    apt-get install randomize-lines

So that it can randomize the order of the directories it searches each time. 
But it's not necessary.

Usage
=====

Run xscreensaver-demo, click the 'advanced' tab, and under Text Manipulation -> Program,
enter the command corresponding to the text generator you want to use.

Now select an xscreensaver hack that uses text, such as StarWars or FlipText. These
will paint the generated text across the screen in various interesting ways.

Bugs/Future work
===========

xscreensaver hacks seem to consume text from both stdin and stderr, so it's not
possible to emit errors or warnings without them being echoed to the screensaver
output. This is kind of annoying.

The xscreensaver hacks available by default seem to work on just plain text. It
would be nice to be able to do some rudimentary inline formatting (e.g. bold, 
italics... maybe even colour syntax highlighting). Maybe I'll write an 
xscreensaver hack that works with some small subset of html/css.
