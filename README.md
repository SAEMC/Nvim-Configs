# SAEMC's Nvim-Configs

## Prerequisites

### Recommended

#### OS version

- Ubuntu >= 20.04 LTS
- macOS >= Big Sur

#### Install and apply

- SAEMC's [iTerm2-Configs](https://github.com/SAEMC/iTerm2-Configs.git)
- SAEMC's [Tmux-Configs](https://github.com/SAEMC/Tmux-Configs)

### (Optional) Install `sudo` and `git`

- If you'd never installed, run the following command

```shell
apt-get update && apt-get install -y sudo git
```

### Clone this repository

```shell
git clone https://github.com/SAEMC/Nvim-Configs && \
cd ./Nvim-Configs/
```

<br/>

## Installation

- [Neovim](https://github.com/neovim/neovim) version >= v0.8.0 (will be installed if you install dependencies)
- Enter following command: `./nvim_configs.sh [OPTION]` (must be in `Nvim-Configs` directory)

### Recommended

- Install dependencies & [NvChad](https://github.com/NvChad/NvChad) first

```shell
./nvim_configs.sh -a
```

- And then install SAEMC only

```shell
./nvim_configs.sh -s
```

- Finally remove this repository

```shell
cd .. && rm -r ./Nvim-Configs/
```

### Install partially

#### Install dependencies & NvChad

```shell
./nvim_configs.sh -a
```

#### Install dependencies

```shell
./nvim_configs.sh -d
```

#### Install NvChad

```shell
./nvim_configs.sh -n
```

#### Install SAEMC

```shell
./nvim_configs.sh -s
```

### Activate dependencies in current shell

#### Ubuntu

```shell
source ~/.bashrc
```

#### macOS

```shell
source ~/.zshrc
```

### Remove this repository

```shell
cd .. && rm -r ./Nvim-Configs/
```

<br/>

## Sync plugins and apply configs

### Recommended

```shell
nvim +PackerSync +MasonInstallAll
```

### Sync plugins (with additional plugins below)

- [iron.nvim](https://github.com/hkupty/iron.nvim) (is to throw codes of script languages such as Python to the REPL)
- [null-ls.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim) (is to format entire codes of current file on save)
- [nvim-scrollview](https://github.com/dstein64/nvim-scrollview) (is to display interactive vertical scrollbars)
- [nvim-osc52](https://github.com/ojroques/nvim-osc52) (is to yank codes into system clipboard)
- [vim-surround](https://github.com/tpope/vim-surround) (is to surround codes with a pair of specifig characters: `''`, `""`, `()`, `{}`, `[]`, and etc.)

```shell
nvim +PackerSync
```

### Apply [Mason](https://github.com/williamboman/mason.nvim) configs

```shell
nvim +MasonInstallAll
```

- If unable to install LSPs -> Check dependencies: `npm`, `go`, and etc.
