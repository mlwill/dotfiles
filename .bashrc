#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#PS1='[\u@\h \W]\$ '
#PS1='\[\e[1;34m\][\u@\h \W]\$\[\e[0;37m\]'
PS1='\[\e[1;38;5;34m\][\u@\h \W]\$\[\e[0;38;5;15m\]'
PS2='> '
PS3='> '
PS4='+ '
#trap 'echo -ne "\e[0m"' DEBUG

case ${TERM} in
  xterm*|rxvt*|Eterm|aterm|kterm|gnome*)
    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'
                                                        
    ;;
  screen)
    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033_%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'
    ;;
esac

[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion

## Automatic Transparency
#[ -n "$XTERM_VERSION" ] && transset-df -a >/dev/null

## To use the default colors for grep
alias grep='grep -n  --color=auto'

## Enable code syntax coloring in less

export LESSOPEN="| /usr/bin/source-highlight-esc.sh %s"
export LESS=' -R '

## For tmux battery
#export PATH=$PATH:/home/mike/.tmux/scripts

## Colored output for ls
alias ls='ls --color=auto'
eval $(dircolors -b)

## Bleachbit
alias bb="sudo bleachbit --clean system.cache system.localizations system.trash bash.history vim.history"  
alias bbh="bleachbit --clean chromium.cache chromium.cookies chromium.history chromium.vacuum chromium.current_session chromium.dom chromium.search_engines bash.history vim.history"

## Refresh mirrorlist/Update system
alias ml="sudo reflector --verbose -l 5 --sort rate --save /etc/pacman.d/mirrorlist"
alias syy="sudo pacman -Syy"
alias syu="sudo pacman -Syu"

## Define Variables Locally
PATH="${PATH}:/home/mike/bin"

## Prevent accidental file deletion
alias rm="rm -i"

## epub reader
alias fbr="FBReader"

## mpv
alias sonic="mpv --no-video --playlist somafm/sonicuniverse64.pls"
alias groove="mpv --no-video --playlist somafm/groovesalad130.pls"
alias space="mpv --playlist somafm/spacestation130.pls"

## systemctl
alias po="systemctl poweroff"
alias re="systemctl reboot"

## virtualbox
alias vb="virtualbox"

## Disable dpms and prevent screen from blanking (e.g. movies)
alias so="xset -dpms; xset s off"

## Check AUR for updates 
alias cow="cower -uv"

## Check Official Arch Repositories for updates
alias qqu="sudo pacman -Qqu | wc -l"

# Start ipython
alias ipy="ipython --no-banner --no-confirm-exit"

# Start julia 
alias jj="julia -q --color=yes"

# Start ijulia
alias ij="ipython console --profile julia"

# wifi network monitor
alias ww="wavemon"
