# This is the default, but no harm in repeating.
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history

# Store more history.
HISTSIZE=10000
SAVEHIST=10000

# Share history across multiple zsh sessions.
setopt SHARE_HISTORY

# Append to history.
setopt APPEND_HISTORY

# Adds commands as they are typed, not at shell exit.
setopt INC_APPEND_HISTORY

# Expire duplicates first.
setopt HIST_EXPIRE_DUPS_FIRST

# Remove blank lines from history.
setopt HIST_REDUCE_BLANKS

# Enable alt-left/right keyboard shortcuts, to jump by whole words,
# as you’d expect on a Mac.
bindkey -e
bindkey "^[b" backward-word
bindkey '^[f' forward-word

# Remove the "/" character from the list of characters that zsh considers
# part of a "word", so that we can alt-arrow navigate more easily across
# filesystem paths, stopping at each slash, just like Bash does.
export WORDCHARS="${WORDCHARS/\/}"

# Case-insensitive globbing.
# eg: `ls ~/d<tab>`
setopt NO_CASE_GLOB

# Case-insensitive tab-completion.
zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle :compinstall filename "$HOME/.zshrc"

# Autocomplete hosts and directories for SSH etc.
# eg `scp file username@<TAB><TAB>:/<TAB>`
zstyle ':completion:*:(ssh|scp|ftp|sftp):*' hosts $hosts
zstyle ':completion:*:(ssh|scp|ftp|sftp):*' users $users

# Analytics opt-out for Homebrew, before we call any Homebrew functions.
# https://docs.brew.sh/Analytics
export HOMEBREW_NO_ANALYTICS=1

# Autocompletion for Homebrew commands.
# https://docs.brew.sh/Shell-Completion
FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

# `repo` command to quickly jump to a subdirectory of ~/repos,
# with autocompletion of subdirectory names.
repo() {
    cd "$HOME/repos/$1";
}
_repo_comp() {
    reply=( $(cd "$HOME/repos/"; ls -d */ | sed 's/\/$//') );
}
compctl -K _repo_comp repo

# `my` command to quickly jump to a subdirectory of ~/Work/mySociety,
# with autocompletion of subdirectory names.
my() {
    cd "$HOME/Work/mySociety/$1";
}
_my_comp() {
    reply=( $(cd "$HOME/Work/mySociety/"; ls -d */ | sed 's/\/$//') );
}
compctl -K _my_comp my

# Enable autocompletion.
autoload -Uz compinit && compinit

# Enable bash-compatible autocompletion scripts.
autoload -U bashcompinit && bashcompinit

# Autocompletion for pipx.
# https://pipxproject.github.io/pipx/
eval "$(register-python-argcomplete pipx)"

# Show at most 4 levels of path in prompt, followed by either a hash (if running
# with elevated privileges, ie: `sudo -s`) or, otherwise, a command symbol.
export PROMPT='%4~ %(!.#.⌘) '

# Colours for `ls`.
export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad

# Set up the rbenv shims.
# https://github.com/rbenv/rbenv#how-rbenv-hooks-into-your-shell
eval "$(rbenv init - zsh)"
