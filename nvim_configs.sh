#!/bin/bash

function installDependencies() {
  check_localtime="ls /etc/localtime >/dev/null 2>&1"
  check_wget="wget --version >/dev/null 2>&1"
  check_unzip="unzip --version >/dev/null 2>&1"
  check_gcc="gcc --version >/dev/null 2>&1"
  check_gpp="g++ --version >/dev/null 2>&1"
  check_neovim="nvim --version >/dev/null 2>&1"
  check_nvm="nvm --version >/dev/null 2>&1"
  check_node="node --version >/dev/null 2>&1"
  check_locale_en_ubuntu="grep -w 'export LANG=en_US.UTF-8' ~/.bashrc >/dev/null 2>&1"
  check_locale_en_mac="grep -w 'export LANG=en_US.UTF-8' ~/.zshrc >/dev/null 2>&1"
  check_neovim_alias_ubuntu="grep -w 'alias vim=\"nvim\"' ~/.bashrc >/dev/null 2>&1"
  check_neovim_alias_mac="grep -w 'alias vim=\"nvim\"' ~/.zshrc >/dev/null 2>&1"

  # Check OS
  os_type=$(echo "${OSTYPE}")
  echo -e "\n *** Check OSTYPE *** \n"

  # If Ubuntu
  if [[ "$os_type" == "linux-gnu"* ]]; then
    echo -e "\n *** Ubuntu detected *** \n"

    sudo apt-get update

    # Check Local time
    eval "$check_localtime"
    if [[ "$?" -ne 0 ]]; then
      # Install TZdata non-interactive mode
      echo -e "\n *** Install TZdata non-interactive mode *** \n"
      export DEBIAN_FRONTEND=noninteractive

      sudo ln -fs /usr/share/zoneinfo/Asia/Seoul /etc/localtime
      sudo apt-get install -y tzdata
      sudo dpkg-reconfigure --frontend noninteractive tzdata
    fi

    # Install Default software
    echo -e "\n *** Install Default software *** \n"
    sudo apt-get update
    sudo apt-get install -y software-properties-common

    # Check Wget
    eval "$check_wget"
    if [[ "$?" -ne 0 ]]; then
      # Install Wget
      echo -e "\n *** Install Wget *** \n"
      sudo apt-get install -y wget
    fi

    # Check Unzip
    eval "$check_unzip"
    if [[ "$?" -ne 0 ]]; then
      # Install Unzip
      echo -e "\n *** Install Unzip *** \n"
      sudo apt-get install -y unzip
    fi

    # Check gcc
    eval "$check_gcc"
    if [[ "$?" -ne 0 ]]; then
      # Install gcc
      echo -e "\n *** Install gcc *** \n"
      sudo apt-get install -y gcc
    fi

    # Check g++
    eval "$check_gpp"
    if [[ "$?" -ne 0 ]]; then
      # Install g++
      echo -e "\n *** Install g++ *** \n"
      sudo apt-get install -y g++
    fi

    # Check Neovim
    eval "$check_neovim"
    if [[ "$?" -ne 0 ]]; then
      # Download Neovim manually
      echo -e "\n *** Download Neovim v0.8.0 *** \n"
      for i in {1..3}; do
        # Download nvim-linux64.deb
        wget https://github.com/neovim/neovim/releases/download/v0.8.0/nvim-linux64.deb
        # Download nvim-linux64.deb.sha256sum
        wget https://github.com/neovim/neovim/releases/download/v0.8.0/nvim-linux64.deb.sha256sum
        # Check checksum SHA256
        sha256sum -c nvim-linux64.deb.sha256sum

        # Check checksum OK
        if [[ "$?" -eq 0 ]]; then
          echo -e "\n *** Checksum OK *** \n"
          break
        # If checksum NO
        else
          # Remove nvim-linux64.deb and nvim-linux64.deb.sha256sum
          echo -e "\n *** Checksum NO *** \n"
          rm ${PWD}/nvim-linux64.deb
          rm ${PWD}/nvim-linux64.deb.sha256sum
        fi
      done

      # Install Neovim manually
      echo -e "\n *** Install Neovim manually *** \n"
      sudo apt-get install ./nvim-linux64.deb

      if [[ "$?" -ne 0 ]]; then
        sudo dpkg -i --force-overwrite ${PWD}/nvim-linux64.deb  
        sudo apt-get -f install
      fi
    fi

    # Remove nvim-linux64.deb and nvim-linux64.deb.sha256sum
    rm ${PWD}/nvim-linux64.deb
    rm ${PWD}/nvim-linux64.deb.sha256sum

    # If cannot install Neovim manually
    if [[ "$?" -ne 0 ]]; then
      echo -e "\n *** Add Neovim (Unstable) into package *** \n"
      sudo add-apt-repository -yu ppa:neovim-ppa/unstable

      # Install Neovim (Unstable)
      echo -e "\n *** Install Neovim (Unstable) *** \n"
      sudo apt-get install -y neovim
    fi

    # Check Locale en
    eval "$check_locale_en_ubuntu"
    if [[ "$?" -ne 0 ]]; then
      # Write Locale en into ~/.bashrc
      echo -e "\n *** Write Locale en into ~/.bashrc *** \n"
      cat >>${HOME}/.bashrc <<EOF

# Change Locale to en_US.UTF-8
export LANG=en_US.UTF-8
EOF
    fi

    # Check Neovim alias
    eval "$check_neovim_alias_ubuntu"
    if [[ "$?" -ne 0 ]]; then
      # Write Neovim alias into ~/.bashrc
      echo -e "\n *** Write Neovim alias into ~/.bashrc *** \n"
      cat >>${HOME}/.bashrc <<EOF

# Neovim Alias
alias vi="nvim"
alias vim="nvim"
EOF
    fi

    # Check Node
    eval "$check_node"
    if [[ "$?" -ne 0 ]]; then

      # Check NVM
      eval "$check_nvm"
      if [[ "$?" -ne 0 ]]; then
        # Install NVM manually
        echo -e "\n *** Install NVM manually *** \n"
        export NVM_DIR="$HOME/.nvm" && (
        git clone https://github.com/nvm-sh/nvm.git "$NVM_DIR"
        cd "$NVM_DIR"
        git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
        ) && \. "$NVM_DIR/nvm.sh"

        # Write NVM path into ~/.bashrc
        echo -e "\n *** Write NVM path into ~/.bashrc *** \n"
        cat >>${HOME}/.bashrc <<EOF

# NVM
export NVM_DIR="\$HOME/.nvm"
# This loads nvm
[ -s "\$NVM_DIR/nvm.sh" ] && \. "\$NVM_DIR/nvm.sh"
# This loads nvm bash_completion
[ -s "\$NVM_DIR/bash_completion" ] && \. "\$NVM_DIR/bash_completion"
EOF
      fi

      # Install Node LTS
      echo -e "\n *** Install Node LTS *** \n"
      nvm install --lts
      nvm alias default lts/*
      nvm use lts/*
    fi

    # Install Python
    echo -e "\n *** Install Python *** \n"
    sudo apt-get install -y python3-venv
    
  # If Mac
  elif [[ "$os_type" == "darwin"* ]]; then
    echo -e "\n *** Mac detected *** \n"

    # Check Homebrew
    brew_path=$(which brew)
    if [[ "$?" -ne 0 ]]; then
      echo "Mac should install Homebrew first!"
      exit 1
    fi

    # Set Homebrew path
    export PATH="$brew_path:$PATH"

    # Clear Homebrew core repo
    sudo rm -rf $(brew --rep homebrew/repo)
    /bin/zsh -c "brew update"

    # Check Neovim
    eval "$check_neovim"
    if [[ "$?" -ne 0 ]]; then
      # Install Neovim
      echo -e "\n *** Install Neovim *** \n"
      /bin/zsh -c "brew install neovim"
    fi

    # Check Locale en
    eval "$check_locale_en_mac"
    if [[ "$?" -ne 0 ]]; then
      # Write Locale en into ~/.zshrc
      echo -e "\n *** Write Locale en into ~/.zshrc *** \n"
      cat >>${HOME}/.zshrc <<EOF

# Change Locale to en_US.UTF-8
export LANG=en_US.UTF-8
EOF
    fi

    # Check Neovim alias
    eval "$check_neovim_alias_mac"
    if [[ "$?" -ne 0 ]]; then
      # Write Neovim alias into ~/.zshrc
      echo -e "\n *** Write Neovim alias into ~/.zshrc *** \n"
      cat >>${HOME}/.zshrc <<EOF

# Neovim Alias
alias vi="nvim"
alias vim="nvim"
EOF
    fi

    #Check Node
    eval "$check_node"
    if [[ "$?" -ne 0 ]]; then

      # Check NVM
      eval "$check_nvm"
      if [[ "$?" -ne 0 ]]; then
        # Install NVM
        echo -e "\n *** Install NVM *** \n"
        /bin/zsh -c "brew install nvm"
        mkdir ${HOME}/.nvm

        export NVM_DIR="$HOME/.nvm"
        [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
        [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

        # Write NVM path into ~/.zshrc
        echo -e "\n *** Write NVM path into ~/.zshrc *** \n"
        cat >>${HOME}/.zshrc <<EOF

# NVM
export NVM_DIR="\$HOME/.nvm"
# This loads nvm
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
# This loads nvm bash_completion
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
EOF
      fi

      # Install Node LTS
      echo -e "\n *** Install Node LTS *** \n"
      nvm install --lts
      nvm alias default lts/*
      nvm use lts/*
    fi

    # Install Python
    echo -e "\n *** Install Python *** \n"
    /bin/zsh -c "brew install python3"

  # If not Ubuntu and Mac
  else
    echo "${os_type} not supports!"
    exit 1
  fi
}

function installNvChad() {
  # Check OS
  os_type=$(echo "${OSTYPE}")
  # If not Ubuntu and Mac
  if [[ "$os_type" != "linux-gnu"* && "$os_type" != "darwin"* ]]; then
    echo "${os_type} not supports!"
    exit 1
  fi

  # Clear ~/.config/nvim directory
  if [[ -d ${HOME}/.config/nvim ]]; then
    echo -e "\n *** Clear ~/.config/nvim directory *** \n"
    sudo rm -rf ${HOME}/.config/nvim
  fi

  # Clear ~/.local/share/nvim directory
  if [[ -d ${HOME}/.local/share/nvim ]]; then
    echo -e "\n *** Clear ~/.local/share/nvim directory *** \n"
    sudo rm -rf ${HOME}/.local/share/nvim
  fi

  # Clear ~/.cache/nvim directory
  if [[ -d ${HOME}/.cache/nvim ]]; then
    echo -e "\n *** Clear ~/.cache/nvim directory *** \n"
    sudo rm -rf ${HOME}/.cache/nvim
  fi

  # Install NvChad (Latest)
  echo -e "\n *** Install NvChad (Latest) *** \n"
  git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim 
}

function installSaemc() {
  # Check OS
  os_type=$(echo "${OSTYPE}")
  # If not Ubuntu and Mac
  if [[ "$os_type" != "linux-gnu"* && "$os_type" != "darwin"* ]]; then
    echo "${os_type} not supports!"
    exit 1
  fi

  # Clear ~/.config/nvim/lua/custom directory
  if [[ -d ${HOME}/.config/nvim/lua/custom ]]; then
    echo -e "\n *** Clear ~/.config/nvim/lua/custom directory *** \n"
    sudo rm -rf ${HOME}/.config/nvim/lua/custom
  fi
  mkdir ${HOME}/.config/nvim/lua/custom
 
  # Move custom files into ~/.config/nvim/lua/custom directory
  file_name=$(basename "$0")
  rm README.md && mv "$file_name" ".$file_name"
  mv * ${HOME}/.config/nvim/lua/custom/
  mv ".$file_name" "$file_name"
}

usage_msg="Usage:  $(basename $0) [-a] [-d] [-n] [-s]"
option_msg="Options:
  -a   Install Dependencies & NvChad
  -d   Install Dependencies only
  -n   Install NvChad only
  -s   Install SAEMC only"
invalid_msg="Invalid command option."
args=""

if [[ -z "$1" ]]; then
  echo "Need to enter command option."
  echo "$usage_msg"
  exit 1
fi

while getopts ':adns :h' opt; do
  case "$opt" in
    a | d | n | s)
      args+="${opt}"
      ;;
    h)
      echo -e "How to install SAEMC's Nvim-Configs.\n"
      echo -e "${usage_msg}\n"
      echo -e "$option_msg"
      exit 0
      ;;
    ?)
      echo "$invalid_msg"
      echo "$usage_msg"
      exit 1
      ;;
  esac
done

args=$(echo $args | grep -o . | sort | uniq | tr -d "\n")

for (( i = 0; i < ${#args}; i++ )); do
  arg="${args:$i:1}"

  if [[ "$arg" == "a" ]]; then
    installDependencies
    installNvChad
    exit 0
  elif [[ "$arg" == "d" ]]; then
    installDependencies
    exit 0
  elif [[ "$arg" == "n" ]]; then
    installNvChad
    exit 0
  elif [[ "$arg" == "s" ]]; then
    installSaemc
    exit 0
  else
    echo "$invalid_msg"
    echo "$usage_msg"
    exit 1
  fi
done

exit 0

