" ********************** Custom Configurations *************************

" Set number relative or not
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc

set nu
set relativenumber
nnoremap <C-M-n> :call NumberToggle()<CR>

" Refresh nvim configurations
nnoremap <C-M-f> :source %<CR>

" Quick quit
nnoremap qq :q<CR>

" No hightlight
nnoremap <Esc><Esc> :nohl<CR>

" Map Tab as C-w
nnoremap <Tab> <C-w>w
nnoremap <S-Tab> <C-w>W

" List buffers and switch buffer
nnoremap <M-l> :ls<CR>
nnoremap <M-1> :buffer 1<CR>
nnoremap <M-2> :buffer 2<CR>
nnoremap <M-3> :buffer 3<CR>
nnoremap <M-4> :buffer 4<CR>
nnoremap <M-5> :buffer 5<CR>
nnoremap <M-6> :buffer 6<CR>
nnoremap <M-7> :buffer 7<CR>
nnoremap <M-8> :buffer 8<CR>
nnoremap <M-9> :buffer 9<CR>

" Highline current line
set cursorline
" hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
" hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
" nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

filetype plugin indent on
" show existing tab with 2 spaces width
set tabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2
" On pressing tab, insert 2 spaces
set expandtab

" **********************       End Config      *************************


" Plugins: {{{

" Specify a directory for plugins
call plug#begin('$HOME/.local/share/nvim/plugged')

" CQuery: {{
    Plug 'autozimu/LanguageClient-neovim', {
        \ 'branch': 'next',
        \ 'do': 'bash install.sh',
        \ }
    
    " Multi-entry selection UI. FZF
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'

    " Configure cquery and key maps
    let g:LanguageClient_serverCommands = {
        \ 'cpp': ['cquery', '--log-file=/tmp/cq.log'],
        \ 'c': ['cquery', '--log-file=/tmp/cq.log'],
        \ } 

    let g:LanguageClient_loadSettings = 1 " Use an absolute configuration path if you want system-wide settings 
    let g:LanguageClient_settingsPath = '$HOME/.config/nvim/settings.json'
    set completefunc=LanguageClient#complete
    set formatexpr=LanguageClient_textDocument_rangeFormatting()
    
    nnoremap <silent> <M-h> :call LanguageClient_textDocument_hover()<CR>
    nnoremap <silent> <M-d> :call LanguageClient_textDocument_definition()<CR>
    nnoremap <silent> <M-r> :call LanguageClient_textDocument_references()<CR>
    nnoremap <silent> <M-s> :call LanguageClient_textDocument_documentSymbol()<CR>
    nnoremap <silent> <M-n> :call LanguageClient_textDocument_rename()<CR>"
    nnoremap <silent> <M-f> :call LanguageClient#textDocument_formatting()<CR>"
" }}

" Neosnippets: {{
    Plug 'Shougo/neosnippet'
    Plug 'Shougo/neosnippet-snippets'

    imap <C-k> <Plug>(neosnippet_expand_or_jump)
    smap <C-k> <Plug>(neosnippet_expand_or_jump)
    xmap <C-k> <Plug>(neosnippet_expand_target)
" }}

" Deoplete: {{
    if has('nvim')
      Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    else
      Plug 'Shougo/deoplete.nvim'
      Plug 'roxma/nvim-yarp'
      Plug 'roxma/vim-hug-neovim-rpc'
    endif
    let g:deoplete#enable_at_startup = 1
" }}

" NERDTree: {{
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    nmap <F3> :NERDTreeToggle<CR>
" }}

" Tagbar: {{
    Plug 'majutsushi/tagbar'
    nmap <F2> :TagbarToggle<CR>
" }}

" Vimgitgutter: {{
    Plug 'airblade/vim-gitgutter'
    :GitGutterEnable
"

call plug#end()

" }}}
