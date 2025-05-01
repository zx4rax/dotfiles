export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(
	git
	ssh
	zsh-autosuggestions
	zsh-syntax-highlighting
	zsh-bat
	tldr
	aliases
	ansible
	tmux
	web-search
	thefuck
	pass
)
source $ZSH/oh-my-zsh.sh
bindkey -s ^f "tmux-sessionizer\n"

bindkey -s ^p "pass-fzf\n"

bindkey -s ^o "pass-fzf --otp\n"


alias zshconfig="mate ~/.zshrc"
alias ohmyzsh="mate ~/.oh-my-zshi"
alias myip="curl myip.wtf/json"
alias discord_install='temp_dir=$(mktemp -d) && cd "$temp_dir" && curl -L "https://discord.com/api/download/stable?platform=linux&format=deb" -o discord.deb && sudo dpkg -i discord.deb && sudo apt-get install -f -y'
alias ports="sudo netstat -tulanp"                  # Display open ports
alias free="free -h"                                # Show memory usage
alias update="sudo apt update -y && sudo apt upgrade -y && sudo apt autoremove -y"
alias h="history"
alias j="jobs -l"
alias t="top"
alias psg="ps aux | grep"                          # Search for a process
alias reload="source ~/.zshrc"                     # Reload zsh configuration
alias norg="gron --ungron"
alias ungron="gron --ungron"
alias tidal-dl="./home/xigma/tidal-dl/tidal/bin/tidal-dl"                #tidal downloader app
alias vim="nvim"
alias clean="sudo apt autoremove -y && sudo apt clean && sudo find /var/log -type f -name '*.log' -delete && sudo rm -rf ~/.cache/*"

PROMPT='%(?:%{$fg_bold[white]%}%1{Χ%} :%{$fg_bold[white]%}%1{Χ%} )%{$fg[cyan]%}%c%{$reset_color%} $(git branch 2>/dev/null | grep "*" | sed -e "s/* //g") '

export PATH="$PATH:$HOME/go/bin"
export PATH="$PATH:/opt/nvim/"
export PATH="$PATH:$HOME/.local/zig-linux-x86_64-0.14.0"
export PATH="$PATH:$HOME/.local/bin"
eval "$(starship init zsh)"
