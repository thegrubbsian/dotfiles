export PATH=/usr/local/mysql/bin:/usr/local/lib/node_modules:/usr/local/bin:$PATH

# Rails Aliases
alias be='bundle exec'
alias sc='script/console'
alias ss='script/server -u'
alias rc='bundle exec rails console'
alias rs='bundle exec rails server -u'
alias re='ruby -e'

# PostgreSQL Aliases
alias pgstart='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pgstop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'

# Misc Aliases
alias ctags="'brew --prefix'"/bin/ctags
alias findn='find . -name'

# Load RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

parse_git_branch() {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\ →\ \1/'
}

review-for-sha() {
	parent=`git show $1^ --pretty=%H | awk 'NR==1 {print}'`
	post-review --revision-range $parent:$1
}

export PS1='\u\[\e[1;37m\]@\[\e[1;32m\]\h\[\e[1;37m\]:\[\e[1;31m\]\W\[\e[1;33m\]$(parse_git_branch)\[\e[0;39m\]> '
export PROMPT_COMMAND='echo -ne "\033]0;${PWD}\007"'