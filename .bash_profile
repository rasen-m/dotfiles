alias .s="cd ~/dropbox/studies/"
alias .s1="cd ~/dropbox/studies/cmpt383"
alias .c="cd ~/dropbox/devel/_current"
alias .c1="cd ~/dropbox/devel/_current/assignments/cmpt383"
alias .r="cd ~/dropbox/devel/_resources"
alias .ssh1="ssh sean@sillygrubs.com"
alias .ssh2="ssh -i keypath Sean@ec2-54-187-172-82.us-west-2.compute.amazonaws.com"
alias .pmrs='python manage.py runserver'
alias artisan='php artisan'

alias mysql=/usr/local/mysql/bin/mysql
alias mysqladmin=/usr/local/mysql/bin/mysqladmin

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/dropbox/devel
# source /Library/Frameworks/Python.framework/Versions/2.7/bin/virtualenvwrapper.sh 

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
export PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"

# Setting PATH for Python 3.3
# The orginal version is saved in .bash_profile.pysave
export PATH="/Library/Frameworks/Python.framework/Versions/3.3/bin:${PATH}"

# Prolog
export PATH=/Applications/SWI-Prolog.app/Contents/MacOS:$PATH

# Set MySQL PATH
export PATH=~/bin:/usr/local/bin:/usr/local/mysql/bin:$PATH

# source ~/Documents/Dropbox/developer/python/bin/activate
if [ -f ~/.git-completion.bash ]; then
    source ~/.git-completion.bash
fi

if [ -f ~/.git-prompt.sh ]; then
    source ~/.git-prompt.sh
    export PS1='\[\033[92m\]\u@\h\[\033[97m\]:\[\033[33m\]\W$(__git_ps1 " \[\033[35m\](\[\033[37m\]%s\[\033[35m\])")\[\033[97m\]\$\[\033[0m\] '
fi
