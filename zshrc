# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

alias off="shutdown now"
alias kaggle="cd ~/repos/kaggle-krew/competitions && conda activate kaggle-krew"
alias vs_update="wget https://vscode-update.azurewebsites.net/latest/linux-deb-x64/stable -O /tmp/code_latest_amd64.deb && sudo dpkg -i /tmp/code_latest_amd64.deb"
alias plan="zsh ~/scripts/open_plan.sh"

source /home/sean/Documents/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /home/sean/Documents/z.sh

export PATH="/home/sean/anaconda3/bin:$PATH"
. "/home/sean/anaconda3/etc/profile.d/conda.sh"

export PATH=/usr/local/cuda-9.0/bin${PATH:+:${PATH}}
export PATH=/home/sean/.local/bin:$PATH
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/cuda/extras/CUPTI/lib64"
export EDITOR=vim
