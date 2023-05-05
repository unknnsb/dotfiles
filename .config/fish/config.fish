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
alias cat batcat

set -gx EDITOR nvim

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH
set -gx PATH ~/.local/share/nvm/*/bin $PATH
set -gx PATH ~/.local/share/bob/nvim-bin $PATH

# NodeJS
set -gx PATH node_modules/.bin $PATH

# Cargo
set -gx PATH ~/.cargo/bin $PATH

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
set -gx PNPM_HOME "/home/itznesbro/.local/share/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end

# Deno
set -gx DENO_INSTALL "/home/itznesbro/.deno/bin"
set -gx PATH "$DENO_INSTALL" $PATH

# Mason.nvim
set -gx PATH "/home/itznesbro/.local/share/nvim/mason/bin" $PATH

# Neovim Config Switcher
set -x items "nvim\nLazyVim"

function nvims
    set selected_value (echo -e $items | fzf --select-1)
    if [ -n "$selected_value" ]
        set -x NVIM_APPNAME $selected_value
        nvim
    end
end

# Define function to switch git branches using fzf
function gco
  # Get the list of all git branches and pass them to fzf
  set branch (git branch -a | sed 's/^[* \t]*//' | fzf)

  # Check if a branch was selected
  if test -n "$branch"
    # Switch to the selected branch using git checkout
    git checkout $branch
  end
end

abbr -a gco 'gco'

function ghqcd
  # Get the list of directories and pass them to fzf
  set -l ghq_dir ~/.ghq/github.com/ItzNesbroDev/
  set -l target (find $ghq_dir -type d -maxdepth 1 -mindepth 1 -exec basename {} \; | fzf)

  # Check if a directory was selected
  if test -n "$target"
    # Change to the selected directory
    cd "$ghq_dir$target"
  end
end

# Create an abbreviation for the function
abbr -a fcd 'ghqcd'

export OPENAI_API_KEY=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
