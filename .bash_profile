export PATH=$HOME/.rbenv/bin:/usr/local/mysql/bin:/usr/local/lib/node_modules:/usr/local/bin:$PATH

# Path Aliases
alias s='cd ~/source'

# Git Aliases
alias gc='git commit -m'
alias ga='git add .'
alias gp='git push'
alias gs='git status'
alias gap='git add -p'
alias gdiff='git difftool'

# Rails Aliases
alias be='bundle exec'
alias sc='script/console'
alias ss='script/server -u'
alias rc='bundle exec rails console'
alias rs='bundle exec rails server -u'
alias ber='bundle exec rake'
alias bes='bundle exec rspec'
alias beu='bundle exec unicorn -c config/unicorn.rb'
alias fs='foreman start -f'

# Misc Ruby Aliases
alias rspec='rspec -cfn'
alias spec='spec -cfn'

# PostgreSQL Aliases
alias pgstart='pg_ctl -D /usr/local/var/postgres/ -l /usr/local/var/postgres/server.log start'
alias pgstop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'
alias pg='postgres -D /usr/local/psql/data/'

# Misc Aliases
alias findn='find . -name'
alias line_count='xargs wc -l | sort -n -r'
alias v='mvim .'

# rbenv
eval "$(rbenv init -)"

parse_git_branch() {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\ →\ \1/'
}

review-for-sha() {
  parent=`git show $1^ --pretty=%H | awk 'NR==1 {print}'`
  post-review --revision-range $parent:$1
}

export PS1='\u\[\e[1;37m\]@\[\e[1;32m\]\h\[\e[1;37m\]:\[\e[1;31m\]\W\[\e[1;33m\]$(parse_git_branch)\[\e[0;39m\]> '
export PROMPT_COMMAND='echo -ne "\033]0;${PWD}\007"'
