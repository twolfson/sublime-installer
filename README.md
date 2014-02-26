# sublime-installer [![Build status](https://travis-ci.org/twolfson/sexy-bash-prompt.png?branch=master)](https://travis-ci.org/twolfson/sexy-bash-prompt)

Shell script to install [Sublime Text][] 2 and 3

This was built to make [Travis CI][] integrations with [Sublime Text][] easier. It is also part of the [Sublime plugin tests][] framework.

[Travis CI]: https://travis-ci.org/
[Sublime Text]: http://sublimetext.com/
[Sublime plugin tests]: https://github.com/twolfson/sublime-plugin-tests

```bash
$ ./install.sh 3
gpg: keyring `/tmp/tmpWy5NMR/secring.gpg' created
...
Setting up sublime-text-installer (3047-2~webupd8~3) ...
$ sublime_text --version
Sublime Text Build 3047
```

## Usage
### One-liner
`sublime-installer` takes one parameter which is the Sublime Text version. This can be `2` or `3`.

```sh
https://raw.github.com/twolfson/sublime-installer/master/install.sh | sh -s VERSION
```

### semver
To prevent changes from breaking your scripts, it is suggested you use a [semver][] script over `master`.

```sh
https://raw.github.com/twolfson/sublime-installer/SEMVER/install.sh | sh -s VERSION
# e.g. https://raw.github.com/twolfson/sublime-installer/0.1.0/install.sh | sh -s 2
```

[semver]: http://semver.org/

### Travis integration
`sublime-installer` can be integrated with `.travis.yml` in the following manner:

```yml
env:
  - SUBLIME_TEXT_VERSION="2"
  - SUBLIME_TEXT_VERSION="3"
install:
  - https://raw.github.com/twolfson/sublime-installer/SEMVER/install.sh | sh -s $SUBLIME_TEXT_VERSION
```

## Contributing
In lieu of a formal styleguide, take care to maintain the existing coding style. Add unit tests for any new or changed functionality. Test via `./test/sublime-installer_test.sh`.

## Donating
Support this project and [others by twolfson][gittip] via [gittip][].

[![Support via Gittip][gittip-badge]][gittip]

[gittip-badge]: https://rawgithub.com/twolfson/gittip-badge/master/dist/gittip.png
[gittip]: https://www.gittip.com/twolfson/

## Unlicense
As of Oct 14 2013, Todd Wolfson has released this repository and its contents to the public domain.

It has been released under the [UNLICENSE][].

[UNLICENSE]: UNLICENSE
