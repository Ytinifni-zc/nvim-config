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

## Plugins

### Clang env configuration

- [LSP](https://github.com/autozimu/LanguageClient-neovim)
- [Cquery](https://github.com/cquery-project/cquery) is depended.

Key Mapping:
- `<M-h>`: hover
- `<M-d>`: Jump to definition
- `<M-r>`: List references
- `<M-s>`: Document symbol
- `<M-n>`: Remame(Refactor)
- `<M-f>`: Formatting code

### Project configuration

- [Neosnippets](https://github.com/Shougo/neosnippet.vim) and [Neosnippets-snippets](https://github.com/Shougo/neosnippet-snippets) are using for fast code templete completion.
- [Deoplete](https://github.com/Shougo/deoplete.nvim) is the basic completing engine.
- [NERDTree](https://github.com/scrooloose/nerdtree) shows a toggle to list the project directory.
- [NERDTreeGitPlugin](https://github.com/Xuyuanp/nerdtree-git-plugin<Paste>) adds git status to NERDTree.
- [Tagbar](https://github.com/majutsushi/tagbar) shows a toggle for code structions.
- [VimFugitive](https://github.com/tpope/vim-fugitive) offers git operations commands in nvim.

### Vision enhancer (May slow down nvim)

- [VimDevicons](https://github.com/ryanoasis/vim-devicons) shows file icons in nvim.
- [AirLine](https://github.com/ryanoasis/vim-airline/vim-airline) beautifies state line and tabline.
- [CppColorEnhancer](https://github.com/octol/vim-cpp-enhanced-highlight) cpp code color enhancer.

## Screen shots

[](./screenshots/nvim-config.png)
