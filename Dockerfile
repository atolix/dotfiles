FROM ubuntu:22.04

RUN apt update && \
    apt-get update && \
    apt install -y curl git ripgrep tar unzip vim wget fzf

RUN wget https://github.com/neovim/neovim/releases/download/v0.9.5/nvim-linux64.tar.gz && \
    tar -zxvf nvim-linux64.tar.gz && \
    mv nvim-linux64/bin/nvim usr/bin/nvim && \
    mv nvim-linux64/lib/nvim usr/lib/nvim && \
    mv nvim-linux64/share/nvim/ usr/share/nvim && \
    rm -rf nvim-linux64 && \
    rm nvim-linux64.tar.gz

RUN git clone --depth 1 https://github.com/wbthomason/packer.nvim  ~/.local/share/nvim/site/pack/packer/start/packer.nvim

RUN curl -fsSLO https://deno.land/install.sh \
    && DENO_INSTALL=/usr/local sh install.sh v1.39.4 \
    && rm install.sh

RUN apt install -y locales && \
    locale-gen ja_JP.UTF-8

RUN git clone -b dotfiles https://github.com/atolix/dotfiles.git

RUN rm ~/.bashrc && \
    rm ~/.config/nvim/init.vim && \
    ln -s /dotfiles/nvim/init.lua ~/.config/nvim/init.lua && \
    ln -s /dotfiles/nvim/plugins.lua ~/.config/nvim/plugins.lua && \
    ln -s /dotfiles/nvim/coc-settings.json ~.config/nvim/coc-settings.json
