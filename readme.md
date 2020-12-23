# system

> my `nix`, `nixpkgs`, `nix-darwin`, and `home-manager`-based reproducible system configuration for macOS

The idea here is to migrate as much as possible of my dotfiles (e.g., `.zshrc`), package managers (e.g., `brew`), and macOS system configuration to a setup that can be easily, predictably, idempotently, and recoverably declared using `nix`, `nixpkgs`, `nix-darwin`, and `home-manager`. Currently, my effort in that regard exists as [4cm4k1/dotfiles](https://github.com/4cm4k1/dotfiles). This will better organize all of these things and take advantage of the `/nix/store`, enable speedy system bootstrapping, rollbacks, and recovery, and lay a foundation for defining my own Nix expressions when developing.

> inspired in large part by prior art such as [kclejeune/system](https://github.com/kclejeune/system)

## Table of Contents

- [Installation](#installation)
- [Development](#development)
- [Usage](#usage)
- [Code of Conduct](#code-of-conduct)
- [Contributing](#contributing)
- [Contributors](#contributors)
- [Changelog](#changelog)
- [License](#license)

## Installation

> Prereqs: **macOS**

With no other prereqs, run the following `bash` snippet to pull down this repo to wherever you would like to keep your local Git repos (e.g., `cd ~/Code`, then this repo will exist at `~/Code/system` with a symbolic link to it at `~/.nixpkgs`):

```shell
#! /usr/bin/env bash

# `curl` this repo's tarball
#    - `s`: in silent mode
#    - `S`: show errors
#    - `L`: follow redirects
#    - `|`: pipe `stdout`
curl -sSL https://github.com/4cm4k1/system/archive/main.tar.gz |
  # use `tar`
  #    - `s`: apply substitution pattern
  #    - `x`: in extract mode
  #    - `/^system-main/system/`: pattern
  #    - `-`: from `stdin`
  tar sx /^system-main/system/ - &&
  # `cd` into `system`
  cd system &&
  # `use `ln`
  #    - `f`: overwrite destination
  #    - `s`: make symbolic link
  #    - `$(pwd -P)`: target, current working directory, `P`: ignoring symlinks
  #    - `~/.nixpkgs`: destination
  ln -fs "$(pwd -P)" ~/.nixpkgs
```

Then, install `nix`, `nix-darwin`, and `home-manager`:

```shell
#! /usr/bin/env bash

if [[ $(uname -s) == 'Darwin' ]]; then
  # `nix`
  sh <(curl -L https://nixos.org/nix/install) --daemon --darwin-use-unencrypted-nix-store-volume
  # `nix-darwin`
  nix-build https://github.com/LnL7/nix-darwin/archive/master.tar.gz -A installer
  ./result/bin/darwin-installer
  # `home-manager`
  nix-channel --add https://github.com/nix-community/home-manager/archive/release-20.09.tar.gz home-manager
  nix-channel --update
  nix-shell '<home-manager>' -A install
else
  echo 'This is intended for macOS!'
fi
```

## Development

- [Volta](https://github.com/volta-cli/volta), [Node](https://github.com/nodejs/node), and [npm](https://github.com/npm/cli)

```shell
# install `volta`
curl https://get.volta.sh | bash

# install `node` and `npm`
volta install node@15 npm@7
```

## Usage

```shell
# tbd
```

## [Code of Conduct](.github/code_of_conduct.md)

## [Contributing](.github/contributing.md)

## Contributors

| Name             | Website               |
| ---------------- | --------------------- |
| **Anthony Maki** | <https://anthony.app> |

## [Changelog](changelog.md)

## [License](license)
