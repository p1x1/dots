# arrows_issue
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# functions
function mkt(){
        mkdir nmap content exploit
}
function vpn(){
	t0=$(ifconfig tun0 2>/dev/null| grep -oP "inet .*? " | tr -d 'inet ')
	echo "$t0"
}


# openvpn

# Prompt
PROMPT="%F{yellow}┌[%f%F{cyan}$(vpn)%F{yellow}]─[%f%F{white}$USER%f%F{yellow}@%f%F{cyan}$(uname -a | awk '{print $9"-"$10}')%f%F{yellow}]─[%f%F{white}%d%f%F{yellow}]%f"$'\n'"%F{yellow}└╼%f%F{white}[%f%F{yellow}*%f%F{white}]%f%F{yellow}$%f "
# Export PATH$
export PATH=~/.local/bin:/snap/bin:/usr/sandbox/:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/usr/share/games:/usr/local/sbin:/usr/sbin:/sbin:$PATH

# alias
alias ls='ls -lh --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
#####################################################
# Auto completion / suggestion
# Mixing zsh-autocomplete and zsh-autosuggestions
# Requires: zsh-autocomplete (custom packaging by Parrot Team)
# Jobs: suggest files / foldername / histsory bellow the prompt
# Requires: zsh-autosuggestions (packaging by Debian Team)
# Jobs: Fish-like suggestion for command history
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
#source /usr/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
# Select all suggestion instead of top on result only
zstyle ':autocomplete:tab:*' insert-unambiguous yes
zstyle ':autocomplete:tab:*' widget-style menu-select
zstyle ':autocomplete:*' min-input 2
bindkey $key[Up] up-line-or-history
bindkey $key[Down] down-line-or-history


##################################################
# Fish like syntax highlighting
# Requires "zsh-syntax-highlighting" from apt

source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Save type history for completion and easier life
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# Useful alias for benchmarking programs
# require install package "time" sudo apt install time
# alias time="/usr/bin/time -f '\t%E real,\t%U user,\t%S sys,\t%K amem,\t%M mmem'"
# Display last command interminal
echo -en "\e]2;Parrot Terminal\a"
preexec () { print -Pn "\e]0;$1 - Parrot Terminal\a" }



