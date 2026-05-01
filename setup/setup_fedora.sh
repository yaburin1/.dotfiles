#!/bin/bash
########################################
# Fedora-43 for WSL + atcoder + neovim #
########################################
cd

# cargo-compete -> openssl-devel, jq, wslu
# Rust Iced -> vulkan-loader,vulkan-tools
# IME -> fcitx5, fcitx5-mozc, xset
sudo dnf -y update && sudo dnf -y upgrade && \
sudo dnf -y group install development-tools && \
sudo dnf -y copr enable wslutilities/wslu fedora-41-x86_64 && \
sudo dnf -y install \
    gcc-c++ \
    fd-find \
    ripgrep \
    wl-clipboard \
    yarnpkg \
    gh \
    clang-devel \
    openssl-devel \
    jq \
    wslu \
    vulkan-loader \
    vulkan-tools \
    fcitx5 \
    fcitx5-mozc \
    xset

# rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source ~/.bashrc
cargo install cargo-binstall 
cargo binstall -y tree-sitter-cli
rustup component add rustfmt clippy rust-docs
# cargo compete
cargo install cargo-compete
rustup toolchain install 1.89.0-x86_64-unknown-linux-gnu


# neovim 
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage && \
chmod u+x nvim-linux-x86_64.appimage && \
./nvim-linux-x86_64.appimage --appimage-extract && \
rm nvim-linux-x86_64.appimage && \
sudo mv squashfs-root/ /opt/nvim/ && \
sudo ln -sf /opt/nvim/AppRun /usr/bin/nvim


# .dotfiles set
git clone https://github.com/yaburin1/.dotfiles.git
mkdir ~/.config

ln -sf ~/.dotfiles/nvim/ ~/.config
ln -sf ~/.dotfiles/bash/.bashrc ~/.bashrc
ln -sf ~/.dotfiles/bash/.dircolors ~/.dircolors
ln -sf ~/.dotfiles/git/.gitconfig ~/.gitconfig


# atcoder
mkdir ~/atcoder
cd ~/atcoder
echo "2" | cargo compete init atcoder
ln -sf ~/.dotfiles/atcoder/* ~/atcoder
sudo tee -a /etc/wsl.conf <<EOF
[interop]
enabled=true
appendWindowsPath=true
EOF
source ~/.bashrc
########### vulkanが存在しないデバイスを読まないようにする ##########
sudo mkdir -p /usr/share/vulkan/icd.d/disabled

sudo mv /usr/share/vulkan/icd.d/*radeon* /usr/share/vulkan/icd.d/disabled/
sudo mv /usr/share/vulkan/icd.d/*nouveau* /usr/share/vulkan/icd.d/disabled/
sudo mv /usr/share/vulkan/icd.d/*panfrost* /usr/share/vulkan/icd.d/disabled/
sudo mv /usr/share/vulkan/icd.d/*freedreno* /usr/share/vulkan/icd.d/disabled/
sudo mv /usr/share/vulkan/icd.d/*broadcom* /usr/share/vulkan/icd.d/disabled/
sudo mv /usr/share/vulkan/icd.d/*asahi* /usr/share/vulkan/icd.d/disabled/
sudo mv /usr/share/vulkan/icd.d/*virtio* /usr/share/vulkan/icd.d/disabled/
sudo mv /usr/share/vulkan/icd.d/*powervr* /usr/share/vulkan/icd.d/disabled/
sudo mv /usr/share/vulkan/icd.d/*intel_hasvk* /usr/share/vulkan/icd.d/disabled/
sudo mv /usr/share/vulkan/icd.d/*intel_icd* /usr/share/vulkan/icd.d/disabled/
######## もしくは ##############################################
# export GALLIUM_DRIVER=d2d12
# export MESA_D2D12_DEFAULT_ADAPTER_NAME=NVIDIA
# export VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/dzn_icd.x86_64.json
###############################################################

# 手動設定必要
# fcitx5-configtoolでmzucに設定
#.cargo/config.tomlに以下を設定
# [env]
# WAYLAND_DISPLAY = { value = "", force = true }
