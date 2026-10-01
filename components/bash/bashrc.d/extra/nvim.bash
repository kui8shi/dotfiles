_nvim_os=$(uname -s | sed 's/Darwin/macos/; s/Linux/linux/')
for _nvim_bin in "$HOME"/.local/nvim-"$_nvim_os"-*/bin; do
  [ -d "$_nvim_bin" ] && export PATH=$PATH:$_nvim_bin
done
unset _nvim_bin _nvim_os
if (type nvim &> /dev/null);then
    alias vim='nvim'
    alias n='nvim'
    alias nvimconfig="nvim ~/.config/nvim"
    export EDITOR='nvim'
elif (type vim &> /dev/null);then
    export EDITOR='vim'
fi

function refresh(){
  echo c
}
