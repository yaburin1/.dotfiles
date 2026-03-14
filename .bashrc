# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

###追加設定###

#起動時ディレクトリ
# cd /home/ryusei

#lessの文字コード設定
export LESSCHARSET=utf-8

#スタックサイズ解除
ulimit -s unlimited

#MasonのLSPサーバーのパスを通す
# export PATH="$HOME/.local/share/nvim/mason/bin:$PATH"
# export PATH="$HOME/.local/bin:$PATH"

parse_git_branch() {
  branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
  if [ -n "$branch" ]; then
    echo "($branch)"
  fi
}

#表示形式
PS1="\[\e[35m\][\w/]\[\e[32m\]\$(parse_git_branch)\[\e[0m\]:"

# フォルダ名のみでその階層に移動できるようにする(>bash4.0)
shopt -s autocd
alias ...='cd ../..'
alias ....='cd ../../..'


#その他alias
alias la='ls -al'
alias ll='ls -l'

#accショートカット
alias atest="g++ -std=gnu++23 -O0 -Wall -Wextra ./a.cpp && oj t"
function anew() {
    acc new "$1" && cd "$1"
}

#Rustのパスを追加
. "$HOME/.cargo/env"
