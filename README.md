# SAEMC's Nvim-Configs

## 1. 준비 사항

### 1-1. (권장) SAEMC's [iTerm2](https://github.com/SAEMC/iTerm2-Configs.git) 및 [Tmux](https://github.com/SAEMC/Tmux-Configs) 설정 적용

### 1-2. (Ubuntu만 해당) `sudo` 및 `git` 설치

> Ubuntu 버전 >= 20.04 LTS
>
> 최초 설치인 경우에만 다음 명령어 실행

```shell
apt-get update && apt-get install -y sudo git
```

### 1-3. SAEMC's Nvim-Configs 다운로드 및 설치

```shell
git clone https://github.com/SAEMC/Nvim-Configs && \
cd ./Nvim-Configs
```

> Neovim 버전 >= v0.8.0
>
> `$ ./nvim_configs.sh -a` -> 디펜던시 & [NvChad](https://github.com/NvChad/NvChad) 설치
>
> `$ ./nvim_configs.sh -d` -> 디펜던시만 설치
>
> `$ ./nvim_configs.sh -n` -> NvChad만 설치
>
> `$ ./nvim_configs.sh -s` -> SAEMC만 설치

```shell
./nvim_configs.sh [OPTIONS]
```

> (권장) 디펜던시 & NvChad 설치

```shell
./nvim_configs.sh -a
```

> (권장: 디펜던시 & NvChad 설치 후) SAEMC만 설치

```shell
./nvim_configs.sh -s
```

### 1-4. 디펜던시 설치 활성화

> Ubuntu인 경우

```shell
source ~/.bashrc
```

> Mac인 경우

```shell
source ~/.zshrc
```

### 1-5. (Option) 도커 환경에서 한 번에 NvChad까지 설치

```shell
apt-get update && apt-get install -y sudo git && \
git clone https://github.com/SAEMC/Nvim-Configs && \
cd ./Nvim-Configs && \
./nvim_configs.sh -a
```

<br/>

## 2. 플러그인 동기화 및 설정 적용

### 2-1. 플러그인 동기화

#### 추가 적용 플러그인

- [iron.nvim](https://github.com/hkupty/iron.nvim) (is for throwing Python codes of `*.py` to IPython)
- [null-ls.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim) (is for formatting entire codes of current file on save)
- [nvim-scrollview](https://github.com/dstein64/nvim-scrollview) (is for displaying interactive vertical scrollbars)
- [nvim-osc52](https://github.com/ojroques/nvim-osc52) (is for yanking codes into system clipboard)
- [vim-surround](https://github.com/tpope/vim-surround) (is for surrounding codes with a pair of special characters: `''`, `""`, `()`, `{}`, `[]`, etc.)

```shell
nvim +PackerSync
```

### 2-2. Mason 설정 적용

> 설치불가 LSP -> `npm`, `go` 등 디펜던시 설치 확인

```shell
nvim +MasonInstallAll
```

### 2-3. (Option) 한 번에 동기화 및 적용

```shell
nvim +PackerSync +MasonInstallAll
```
