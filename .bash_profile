export PATH=/usr/local/bin:/usr/local/share/npm/bin:$PATH

export BUNDLER_EDITOR=vim
export EDITOR=vim
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)

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
alias rc='bundle exec rails console'
alias rs='bundle exec rails server'
alias pry='bundle exec pry'
alias rg='bundle exec rails g'

# Misc Ruby Aliases
alias fs='bundle exec foreman start -f'
alias r='bundle exec rake'
alias sp='bundle exec rspec -cfd'
alias ts='bundle exec rake minitest:all:quick'
alias bo='bundle open'

# Phonegap Aliases
alias pb='phonegap build'

# PostgreSQL Aliases
alias pgstart='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/logfile start'
alias pgstop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'

# MySQL Aliases
alias mysqlstart='mysql.server start'
alias mysqlstop='mysql.server stop'

# Elasticsearch Aliases
alias elastic='elasticsearch -f -D es.config=/usr/local/opt/elasticsearch/config/elasticsearch.yml'

# Heroku Aliases
alias h='heroku'
alias hl='heroku logs --tail'
alias hc='heroku run console'
alias hr='heroku run'

# Elixir Aliases
alias m='mix'
alias mt='mix test'

# Misc Aliases
alias findn='find . -name'
alias line_count='xargs wc -l | sort -n -r'
alias v='vim .'
alias reload='source ~/.bash_profile'
alias cleardns='dscacheutil -flushcache && sudo killall -HUP mDNSResponder'
alias tag='ctags -R'
alias ios='open /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/Applications/iPhone\ Simulator.app'

# Git branch name in prompt
parse_git_branch() {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\ →\ \1/ '
}

export PS1='\[\e[1;31m\]\W\[\e[1;33m\]$(parse_git_branch)\[\e[0;39m\]> '
export PROMPT_COMMAND='echo -ne "\033]0;${PWD}\007"'

# Highlighter for copying highlighted code to Keynote, etc
function hlight() {
  if [ -z "$2" ]
    then src="pbpaste"
  else
    src="cat $2"
  fi
  $src | highlight -O rtf --syntax $1 --font Monaco --style solarized-dark --font-size 24 | pbcopy
}

# Chruby
RUBIES+=(~/.rubies)
source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh
