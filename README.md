# dotfiles

**Table of Contents**

<!-- toc -->

- [Resources](#resources)
  - [About](#about)
  - [Installing](#installing)
  - [Folders](#folders)
  - [Screenshot](#screenshot)

<!-- tocstop -->

## Resources

### About

This repository is used to store my personal configuration (dotfiles). Please note it's meant to be used on a macOS platform.

### Installing

The first time you need to run the following commands to install homebrew.

```console
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

After that run the commands below to pull my git dotfiles, install and configure the workspace.

```console
$ mkdir ~/.dotfiles
$ git clone https://github.com/kessyus/dotfiles.git ~/.dotfiles
$ cd .dotfiles
$ ./setup
```

The 'setup' script will create symlinks and install a few applications using homebrew on MacOS.

### Screenshot

The final version of your terminal should look like this:
![image](https://github.com/kessyus/dotfiles/blob/master/media/iTerm2.png?raw=true)
