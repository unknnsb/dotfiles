set fish_greeting ""

set -gx TERM xterm-256color

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always
set -g theme_git_default_branches master

# aliases
alias ls "ls -p -G"
alias la "ls -A"
alias ll "ls -l"
alias lla "ll -A"
alias g git
alias tmp "cd /tmp"
alias cl clear
alias cat bat

# Keymaps
bind \cf "tmux-sessionizer"

set -gx EDITOR nvim

set -gx PATH bin $PATH
set -gx PATH $HOME/bin $PATH
set -gx PATH $HOME/.local/bin $PATH
set -gx PATH $HOME/.local/share/nvm/*/bin $PATH
set -gx PATH $HOME/.local/share/bob/nvim-bin $PATH

# NodeJS
set -gx PATH node_modules/.bin $PATH

# Cargo
set -gx PATH $HOME/.cargo/bin $PATH

# Go
set -g GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH

# NVM
function __check_rvm --on-variable PWD --description 'Do nvm stuff'
    status --is-command-substitution; and return

    if test -f .nvmrc; and test -r .nvmrc
        nvm use
    else
    end
end

switch (uname)
    case Darwin
        source (dirname (status --current-filename))/config-osx.fish
    case Linux
        source (dirname (status --current-filename))/config-linux.fish
    case '*'
        source (dirname (status --current-filename))/config-windows.fish
end

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
    source $LOCAL_CONFIG
end

set -x N_PREFIX "$HOME/n"
contains "$N_PREFIX/bin" $PATH; or set -a PATH "$N_PREFIX/bin" # Added by n-install (see http://git.io/n-install-repo).

# pnpm
set -gx PNPM_HOME "$HOME/.local/share/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end

# Mason.nvim
set -gx PATH "$HOME/.local/share/nvim/mason/bin" $PATH
