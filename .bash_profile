export PATH=$HOME/.rbenv/bin:/usr/local/bin:$PATH

# Git Aliases
alias gc='git commit -m'
alias ga='git add'
alias gp='git push'
alias gs='git status'
alias gap='git add -p'
alias gd='git difftool'
alias gdc='git difftool --cached'
alias gl='git hist'
alias gl5='git hist -5'
alias gl10='git hist -10'
alias gsa='git show'
alias gsf='git show --pretty="format:" --name-only'

# Rails Aliases
alias be='bundle exec'
alias rc='rails console'
alias rs='rails server'

# Misc Ruby Aliases
alias fs='foreman start -f'
alias sp='rspec -cfn'
alias r='rake'

# PostgreSQL Aliases
alias pgstart='pg_ctl -D /usr/local/var/postgres -l logfile start'
alias pgstop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'

# Misc Aliases
alias findn='find . -name'
alias line_count='xargs wc -l | sort -n -r'
alias v='mvim .'

# rbenv
eval "$(rbenv init -)"

parse_git_branch() {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\ →\ \1/'
}

export PS1='\[\e[1;31m\]\W\[\e[1;33m\]$(parse_git_branch)\[\e[0;39m\]> '
export PROMPT_COMMAND='echo -ne "\033]0;${PWD}\007"'
