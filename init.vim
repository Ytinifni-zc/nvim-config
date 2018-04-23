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
highlight LineNr ctermfg=grey

" Refresh nvim configurations
nnoremap <C-M-f> :source %<CR>

" Quick quit
nnoremap qq :q<CR>
nnoremap qQ :q!<CR>
nnoremap QQ :wq<CR>

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
nnoremap <M-0> :buffer 10<CR>

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

" Pair completion
inoremap        (  ()<Left>
inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
inoremap        [  []<Left>
inoremap <expr> ]  strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"
inoremap        {  {}<Left>
inoremap <expr> }  strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"
inoremap        {<CR>  {<CR>}<Esc>O

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" Set true color
if has("termguicolors")
  " set termguicolors
endif

" Set tags
set tags=./.tags;.tags

" **********************       End Config      *************************

" **********************        Plugins        *************************

" Plugins: {{{

" Specify a directory for plugins
call plug#begin($HOME.'/.local/share/nvim/plugged')

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
    let g:LanguageClient_rootMarkers = {
     \ 'cpp': ['.cquery', 'compile_commands.json', 'build'],
     \ 'c': ['.cquery', 'compile_commands.json', 'build'],
     \ }

    let g:LanguageClient_loadSettings = 1 " Use an absolute configuration path if you want system-wide settings 
    let g:LanguageClient_settingsPath = $HOME.'/.config/nvim/settings.json'
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

" Echodoc: {{
    Plug 'Shougo/echodoc.vim'
" }}

" Ale: {{
"    Plug 'w0rp/ale'
"    let g:ale_linters_explicit = 1
"    let g:ale_completion_delay = 500
"    let g:ale_echo_delay = 20
"    let g:ale_lint_delay = 500
"    let g:ale_echo_msg_format = '[%linter%] %code: %%s'
"    let g:ale_lint_on_text_changed = 'normal'
"    let g:ale_lint_on_insert_leave = 1
"    let g:airline#extensions#ale#enabled = 1
"    
"    let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
"    let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++11'
"    let g:ale_c_cppcheck_options = ''
"    let g:ale_cpp_cppcheck_options = ''
"
"    let g:ale_sign_error = "\ue009\ue009"
"    hi! clear SpellBad
"    hi! clear SpellCap
"    hi! clear SpellRare
"    hi! SpellBad gui=undercurl guisp=red
"    hi! SpellCap gui=undercurl guisp=blue
"    hi! SpellRare gui=undercurl guisp=magenta
"
" }}

" NERDTree: {{
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    nmap <F3> :NERDTreeToggle<CR>
" }}

" Tagbar: {{
"    Plug 'majutsushi/tagbar'
"    nmap <F2> :TagbarToggle<CR>
" }}

" LeaderF: {{
    Plug 'Yggdroot/LeaderF'
    nmap <F2> :LeaderfFunction<CR>
" }}

" *** Git ***

" Vimgitgutter: {{
    Plug 'airblade/vim-gitgutter'
    let g:GitGutterEnable = 1
"

" VimFugitive: {{
    Plug 'tpope/vim-fugitive'
" }}

" NerdtreeGitPlugin: {{
    Plug 'Xuyuanp/nerdtree-git-plugin'
    let g:NERDTreeIndicatorMapCustom = {
        \ "Modified"  : "✹",
        \ "Staged"    : "✚",
        \ "Untracked" : "✭",
        \ "Renamed"   : "➜",
        \ "Unmerged"  : "═",
        \ "Deleted"   : "✖",
        \ "Dirty"     : "✗",
        \ "Clean"     : "✔︎",
        \ 'Ignored'   : '☒',
        \ "Unknown"   : "?"
        \ }
" }}

" Gutentags: {{
    Plug 'ludovicchabant/vim-gutentags'

    " gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
    " gutentags searches characters of project directories, and stops
    " recusively searching.
    let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
    
    let g:gutentags_ctags_tagfile = '.tags'
    
    " 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
    let s:vim_tags = expand('~/.cache/tags')
    let g:gutentags_cache_dir = s:vim_tags
    
    let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
    let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
    let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
    
    if !isdirectory(s:vim_tags)
       silent! call mkdir(s:vim_tags, 'p')
    endif
" }}

" Asyncrun: {{
    Plug 'skywind3000/asyncrun.vim'
    let g:asyncrun_open = 6
    let g:asyncrun_bell = 1
    nnoremap <silent> <F4> :AsyncRun -cwd="$(VIM_ROOT)/build" cmake .. <cr>
    nnoremap <silent> <F5> :AsyncRun -raw -cwd=$(VIM_FILEDIR) "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>
    nnoremap <silent> <F6> :AsyncRun -cwd=<root> -raw make test <cr>
    nnoremap <silent> <F7> :AsyncRun -cwd=<root> make -j <cr>
    nnoremap <silent> <F8> :AsyncRun -cwd=<root> -raw make run <cr>
    nnoremap <silent> <F9> :AsyncRun g++ -Wall -O2 "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>
    nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>
" }}

" *** Vision ***

" Powerline: {{
    " May slow down vim, but it bring fancy sightings.
    " Plug 'Lokaltog/vim-powerline'
    " let g:Powerline_symbols = 'fancy'
" }}

" VimDevicons: {{
    Plug 'ryanoasis/vim-devicons'
    set encoding=UTF-8
" }}

" AirLine: {{
    Plug 'vim-airline/vim-airline'

    if !exists('g:airline_symbols')
      let g:airline_symbols = {}
    endif
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline_symbols.branch = ''
    let g:airline_symbols.readonly = ''
    let g:airline_symbols.linenr = '☰'
    let g:airline_symbols.maxlinenr = ''

    let g:airline_extensions = ['branch', 'tabline']

    " Airline Tab
    " let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#left_sep = ' '
    let g:airline#extensions#tabline#left_alt_sep = '|'
    let g:airline#extensions#tabline#formatter = 'unique_tail'

    " Airline Branch
    " let g:airline#extensions#branch#enabled = 1
    let g:airline#extensions#branch#empty_message = ''
    let g:airline#extensions#branch#vcs_priority = ["git", "mercurial"]
    let g:airline#extensions#branch#use_vcscommand = 0
    let g:airline#extensions#branch#format = 1
    let g:airline#extensions#branch#sha1_len = 10
    
" }}

" CppColorEnhancer: {{
    Plug 'octol/vim-cpp-enhanced-highlight'
    let g:cpp_member_variable_highlight = 1
" }}

call plug#end()

" }}}
" **********************      End Plugins       *************************
