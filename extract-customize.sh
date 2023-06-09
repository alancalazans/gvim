#!/bin/bash
#user
unzip _vim.zip -d $HOME/
cp snippets/* $HOME/.vim/snippets/
cp _vimrc $HOME/.vimrc
mkdir $HOME/.local/share/fonts
cp NeoVim_fonts/Droid*.otf $HOME/.local/share/fonts/
unzip NeoVim_fonts/FiraMono.zip -d $HOME/.local/share/fonts/
#root
sudo unzip _vim.zip -d /root/
sudo cp snippets/* /root/.vim/snippets/
sudo cp _vimrc /root/.vimrc
sudo mkdir -p /root/.local/share/fonts
sudo cp NeoVim_fonts/Droid*.otf /root/.local/share/fonts/
sudo unzip NeoVim_fonts/FiraMono.zip -d /root/.local/share/fonts/
#sudo mkdir -p /opt/omnisharp
#sudo tar -zxf Omnisharp-Roslyn-Server/omnisharp-linux-x64-net6.0.tar.gz -C /opt/omnisharp/
#--------------------
# ESLint
# https://eslint.org/
# Instalando:
#--------------------
npm install eslint -g
#--------------------
# Criando arquivo de configuração
# `.eslintrc.js` na pasta de usuário:
#--------------------
echo -e 'module.exports = {
    "env": {
      "browser": true,
      "es2021": true
    },
    "overrides": [
    ],
    extends: [
      "standard",
      "eslint:recommended",
      "prettier"
    ],
    "parserOptions": {
      "ecmaVersion": "latest"
    },
    "rules": {
    }
}' > ~/.eslintrc.js
