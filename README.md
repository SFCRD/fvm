Flex SDK Version Manager
========================

**fvm** is a ruby gem and executable for managing versions of the [Adobe Open Source Flex SDK][flex-sdk].

*It has only been tested on Mac OSX 10.6.4 and is likely to not work on many other configurations.* If you
have any success stories, however, please let me know and I'll add them here.

The manager provides a command-line installation process for any available Flex SDK 4 versions and the 
ability to symlink to the SDK's executables from `/usr/local/bin` (The same place Homebrew suggests). 
This allows programs like `mxmlc`, `asdoc`, and `compc` to be available from the command line easily. 
The manager uses the symlink approach to make it easy to switch the symlinks immediately between 
installed versions of the SDK if you need to.

Installation
------------

`gem install fvm`

Usage
-----

`fvm install` installs a specific Flex SDK version.

`fvm list` lists installed Flex SDK versions.

`fvm use` can switch symlinks to a specific installed Flex SDK version.

`fvm unlink` removes any symlinks installed by **fvm**.

`fvm which` prints the currently-linked Flex SDK version.

Wish-List
---------

- `fvm langref` to install (or build) the language reference for this flex version

[flex-sdk]: http://opensource.adobe.com/wiki/display/flexsdk/Flex+SDK "Adobe Open Source Flex SDK"