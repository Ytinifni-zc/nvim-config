# nvim-config
This is a customized and high-efficiency Neovim configuration, especially for cpp project.

## Install
```shell
git clone git@github.com:Ytinifni-zc/nvim-config.git ~/.nvim

cd ~/.config
ln -s ~/.nvim nvim

# Install vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install cquery
# see https://github.com/cquery-project/cquery/wiki/Getting-started

nvim +PlugInstall +qa

# If Languagecline install failed, go to the pluged folder and rerun ./install
cd ~/.local/share/nvim/plugged/LanguageClient-neovim && ./install.sh

# Customize your snippets
cd ~/.nvim
cp ./snippets/* ~/.local/share/nvim/plugged/neosnippet-snippets/neosnippets/
```
