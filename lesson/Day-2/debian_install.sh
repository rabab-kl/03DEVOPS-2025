#!/bin/bash

set -e

# Vérifier que l'on est bien sur Debian
if ! grep -qi debian /etc/os-release; then
  echo "[!] Ce script est uniquement compatible avec Debian."
  exit 1
fi

echo "[*] Mise à jour des paquets..."
apt update && apt upgrade -y

echo "[*] Installation des paquets requis..."
apt install -y curl git zsh neovim sudo openssh-server locales

echo "[*] Configuration de la locale..."
locale-gen en_US.UTF-8

echo "[*] Installation d'Oh My Zsh..."
export RUNZSH=no
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "[*] Installation de powerlevel10k..."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k

echo "[*] Configuration du thème ZSH..."
sed -i 's/^ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc

echo "[*] Téléchargement de vim-plug pour Neovim..."
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "[*] Création de la configuration Neovim..."
mkdir -p ~/.config/nvim
cat << 'EOF' > ~/.config/nvim/init.vim
set number
set cursorline
syntax on
set showmatch

set autoindent
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set backspace=indent,eol,start

set mouse=a
set clipboard=unnamedplus
set encoding=UTF-8
set fileformat=unix
set completeopt=menuone,noinsert,noselect

set updatetime=300
set signcolumn=yes

autocmd VimEnter * PlugInstall --sync | qa
EOF

echo "[*] Installation terminée. Lancez 'zsh', puis 'nvim' pour installer les plugins automatiquement."
