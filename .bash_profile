export PATH=$HOME/.rbenv/bin:/usr/local/bin:$PATH
export BUNDLER_EDITOR=vim
export EDITOR=vim

# Git Aliases
alias ga='git add'
alias gap='git add -p'
alias gc='git commit -m'
alias gca='git commit --amend'
alias gd='git difftool'
alias gdc='git difftool --cached'
alias gl='git hist'
alias gl5='git hist -5'
alias gl10='git hist -10'
alias gl20='git hist -20'
alias gm='git mv'
alias gp='git push'
alias gpl='git pull'
alias gpr='git pull --rebase'
alias gr='git rm'
alias gs='git status'
alias gsa='git show'
alias gsf='git show --pretty="format:" --name-only'

# TMUX Aliases
export TERM="xterm-256color"
alias tls='tmux ls'
alias ta='tmux attach -t'
alias tk='tmux kill-session -t'
alias tn='tmux new -s'

# Rails Aliases
alias be='bundle exec'
alias rc='rails console'
alias rs='rails server'

# Misc Ruby Aliases
alias fs='foreman start -f'
alias r='rake'
alias sp='rspec -cfn'

# PostgreSQL Aliases
alias pgstart='pg_ctl -D /usr/local/var/postgres -l logfile start'
alias pgstop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'

# Misc Aliases
alias findn='find . -name'
alias line_count='xargs wc -l | sort -n -r'
alias v='vim .'

parse_git_branch() {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\ →\ \1/'
}

export PS1='\[\e[1;31m\]\W\[\e[1;33m\]$(parse_git_branch)\[\e[0;39m\]> '
export PROMPT_COMMAND='echo -ne "\033]0;${PWD}\007"'

# chruby
source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh
