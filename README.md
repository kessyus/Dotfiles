# dotfiles

**Table of Contents**

<!-- toc -->

- [Resources](#resources)
  * [About](#about)
  * [Installing](#installing)
  * [Folders](#folders)

<!-- tocstop -->

## Resources

### About

This repository is used to store my personal configuration (dotfiles). Please note it's meant to be used on a macOS platform.


### Installing

```console
$ mkdir ~/.dotfiles
$ git clone https://github.com/kessyus/dotfiles.git ~/.dotfiles
$ ./setup
```

The 'setup' script will create symlinks and install a few applications using homebrew on MacOS.

### Folders

#### `.vim`

Custom 'vimrc' with few plugins, snippets and hotkeys configured.

#### `.config/alacritty`

Custom alacritty terminal config (fonts, etc.).

#### `.oh-my-zsh`

Since macOS Catalina 'zsh' is the default shell. This plugin adds some custom theme support.
