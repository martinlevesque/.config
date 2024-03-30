if status is-interactive
    # Commands to run in interactive sessions can go here
end

#> fisher list
#jorgebucaran/fisher
#jethrokuan/fzf

# aliases
alias vi 'nvim'
alias vim 'nvim'

rvm default

set -x PATH $PATH /opt/nvim-linux64/bin

eval (direnv hook fish)
