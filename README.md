Flex SDK Version Manager
========================

**FVM is a work in progress! It DOES NOT WORK RIGHT NOW. I'll remove this notice when we're good to go.**

**fvm** is a ruby gem and executable for managing versions of the [Adobe Open Source Flex SDK][flex-sdk].

*It has only been tested on Mac OSX 10.6.4 and is likely to not work on many other configurations.* If you
have any success stories, however, please let me know and I'll add them here.

The manager provides a command-line installation process for any available Flex SDK versions and the 
ability to symlink to the SDK's executables from `/usr/local/bin` (The same place [Homebrew][homebrew] suggests). 
This allows programs like `mxmlc`, `asdoc`, and `compc` to be available from the command line easily. 
The manager uses the symlink approach to make it easy to switch the symlinks immediately between 
installed versions of the SDK if you need to.

Installation
------------

First, install the **fvm** gem:

  gem install fvm

Next, add the following to your bash initialization script (bashrc, bash_init, /etc/profile, whatever you prefer):

  [[ -s $(fvm restart) ]] && source $(fvm restart)
  # This loads FVM into a shell session.

*Note: If you also have **rvm** installed, make sure these lines go **AFTER** the **rvm** initialization.*

Restart your shell and you're good to go.

Caveats
-------

- As of v0.1.1, I've only included `mxmlc`, `asdoc`, and `compc` to the list of executables to link. I'll
  be adding more as fast as I can test them out, but if you want some programs before others, hit me up.

- I'm still trying to find a clean way to reset $FLEX_HOME after installing/using a new Flex SDK version.
  Currently, the environment variable cannot be set in the ruby process, so there is a helper script,
  `fvm-restart` that you'll need to run after either of those commands. Also, `fvm-restart` will be run
  for any new shells (if you followed the installation instructions) so you could just re-start Terminal.

Usage
-----

`fvm install` installs a specific Flex SDK version.

`fvm list` lists installed Flex SDK versions.

`fvm use` can switch symlinks to a specific installed Flex SDK version.

`fvm unlink` removes any symlinks installed by **fvm**.

`fvm which` prints the currently-linked Flex SDK version.

`fvm-restart` re-sets the $FLEX_HOME environment variable.

Wish-List
---------

- `fvm langref` to install (or build) the language reference for this flex version

[flex-sdk]: http://opensource.adobe.com/wiki/display/flexsdk/Flex+SDK "Adobe Open Source Flex SDK"
[homebrew]: https://github.com/mxcl/homebrew "Homebrew GitHub Repo"