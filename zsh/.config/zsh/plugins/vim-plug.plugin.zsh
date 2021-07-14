function plug-init () {
  if [ ! -f ~/.config/nvim/autoload/plug.vim ];  then
    sh -c 'curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    echo "\n\tRead about vim configuration for vim-plug at https://github.com/junegunn/vim-plug\n"
  fi
}

function plug () {
  plug-init
  nvim -c "execute \"PlugInstall\" | qa"
}

function plug-update () {
  plug-init
  nvim -c "execute \"PlugUpdate\" | qa"
}

function plug-upgrade () {
  plug-init
  nvim -c "execute \"PlugUpgrade\" | qa"
}

function plug-clean () {
  plug-init
  nvim -c "execute \"PlugClean\" | qa"
}
