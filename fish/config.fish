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
set -x PATH $PATH /usr/local/go/bin
set -x DOCKER_HOST unix:///var/run/docker.sock


eval (direnv hook fish)
