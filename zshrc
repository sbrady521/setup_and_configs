# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

alias off="shutdown now"
alias vs_update="wget https://vscode-update.azurewebsites.net/latest/linux-deb-x64/stable -O /tmp/code_latest_amd64.deb && sudo dpkg -i /tmp/code_latest_amd64.deb"

source /home/sean/Documents/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /home/sean/Documents/z.sh

export PATH=/home/sean/.local/bin:$PATH
export EDITOR=vim
