# SAEMC's Nvim-Configs

## Prerequisites

### (Recommended) Apply SAEMC's [iTerm2](https://github.com/SAEMC/iTerm2-Configs.git) and [Tmux](https://github.com/SAEMC/Tmux-Configs) configs first

### (Ubuntu only) Install `sudo` and `git`

- Ubuntu version >= 20.04 LTS
- Run the following command for installation only first time

```shell
apt-get update && apt-get install -y sudo git
```

### Clone this repository

```shell
git clone https://github.com/SAEMC/Nvim-Configs && \
cd ./Nvim-Configs
```

## Installation

### Install

- Neovim version >= v0.8.0
- `$ ./nvim_configs.sh -a` -> Install dependencies & [NvChad](https://github.com/NvChad/NvChad)
- `$ ./nvim_configs.sh -d` -> Install dependencies only
- `$ ./nvim_configs.sh -n` -> Install NvChad only
- `$ ./nvim_configs.sh -s` -> Install SAEMC only

```shell
./nvim_configs.sh [OPTIONS]
```

- (Recommended) Install dependencies and NvChad

```shell
./nvim_configs.sh -a
```

- (Recommended: Install dependencies and NvChad first then) Install SAEMC only

```shell
./nvim_configs.sh -s
```

### Activate dependencies in current shell

- If Ubuntu

```shell
source ~/.bashrc
```

- If Mac

```shell
source ~/.zshrc
```

### (Optional) Install where in Docker env at once

```shell
apt-get update && apt-get install -y sudo git && \
git clone https://github.com/SAEMC/Nvim-Configs && \
cd ./Nvim-Configs && \
./nvim_configs.sh -a
```

<br/>

## Sync plugins and apply configs

### Sync plugins (with additional plugins below)

- [iron.nvim](https://github.com/hkupty/iron.nvim) (is for throwing Python codes of `*.py` to IPython)
- [null-ls.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim) (is for formatting entire codes of current file on save)
- [nvim-scrollview](https://github.com/dstein64/nvim-scrollview) (is for displaying interactive vertical scrollbars)
- [nvim-osc52](https://github.com/ojroques/nvim-osc52) (is for yanking codes into system clipboard)
- [vim-surround](https://github.com/tpope/vim-surround) (is for surrounding codes with a pair of special characters: `''`, `""`, `()`, `{}`, `[]`, and etc.)

```shell
nvim +PackerSync
```

### Apply [Mason](https://github.com/williamboman/mason.nvim) configs

- If unable to install LSP -> Check dependencies such as `npm`, `go`, and etc.

```shell
nvim +MasonInstallAll
```

### (Optional) Sync and apply at once

```shell
nvim +PackerSync +MasonInstallAll
```
