Flex SDK Version Manager
========================

**NOTE: This gem is under development (read: IT IS CURRENTLY BROKEN). Please watch the project for any new releases.**

**fvm** is a ruby gem and executable for managing versions of the [Adobe Open Source Flex SDK][flex-sdk].

The manager provides a command-line installation process for any available Flex SDK 4 versions and the 
ability to symlink to the SDK's executables from `/opt/local/bin`. This allows programs like `mxmlc`,
`asdoc`, and `compc` to be available from the command line easily. The manager uses the symlink approach
to make it easy to switch the symlinks immediately between installed versions of the SDK if you need to.

Installation
------------

To install from Rubygems:

`gem install fvm`

Or alternatively, clone the repo, then run `rake install`.

Usage
-----

`fvm install` installs a specific Flex SDK version.

`fvm list` lists installed Flex SDK versions.

`fvm use` can switch symlinks to a specific installed Flex SDK version.

`fvm unlink` removes any symlinks installed by **fvm**.



[flex-sdk]: http://opensource.adobe.com/wiki/display/flexsdk/Flex+SDK "Adobe Open Source Flex SDK"