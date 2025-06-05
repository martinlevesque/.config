if status is-interactive
    # Commands to run in interactive sessions can go here
end

#> fisher list
#jorgebucaran/fisher
#jethrokuan/fzf

# aliases
alias vi 'nvim'
alias vim 'nvim'
alias lgit 'lazygit'
alias ldocker 'lazydocker'

rvm default

set -x PATH $PATH /opt/nvim-linux-x86_64/bin
set -x PATH $PATH /usr/local/go/bin
set -x DOCKER_HOST unix:///var/run/docker.sock
set -x POSTGRES_HOST_PORT 55555

# python related:
pyenv init - fish | source

eval (direnv hook fish)
