" Referrence
" https://thinca.hatenablog.com/entry/20100205/1265307642
" https://www.kaoriya.net/blog/
"
" Basic setting -------------------------------------------

set history=50
set ruler
set showcmd
set wrapscan
set wildmenu
set number
set ignorecase
set smartcase
set incsearch
set hlsearch
set encoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set fileformats=unix,dos,mac
set backspace=indent,eol,start
set showmatch
set matchtime=3
set colorcolumn=80
set t_vb=
set novisualbell
set list
set tabstop=4
set autoindent
set expandtab
set softtabstop=4
set shiftwidth=4

" --- Directory Setting ---
set backupdir=~/.vim/backup
set directory=~/.vim/swap
set updatetime=60000
set undodir=~/.vim/undo

" Neocomplete ---------------------------------------------
filetype off
filetype plugin indent off

" Valuable definition
let s:vimdir = $HOME . '/.vim'
let s:bundledir = s:vimdir . '/bundle/'
let g:vimproc#download_windows_dll = 1
let g:neobundlepath = s:bundledir . '/neobundle.vim'

" Starting setting
if has('vim_starting')
    if &compatible
        set nocompatible
    endif

    if !isdirectory(s:vimdir)
        call system('mkdir ' . s:vimdir)
    endif

    set runtimepath+=$HOME/.vim/bundle/neobundle.vim

    call neobundle#begin(s:bundledir)
    NeoBundleFetch 'Shougo/neobundle.vim'
    NeoBundle "Shougo/vimproc", {
            \ "build": {
            \   "windows"   : "make -f make_mingw32.mak",
            \   "cygwin"    : "make -f make_cygwin.mak",
            \   "mac"       : "make -f make_mac.mak",
            \   "unix"      : "make -f make_unix.mak",
            \ }}

    NeoBundle 'Shougo/neocomplete.vim'
    NeoBundle 'Shougo/neocomplcache'
    NeoBundle 'Shougo/neocomplcache-rsense'
    NeoBundle 'Shougo/neosnippet'
    NeoBundle 'Shougo/neosnippet-snippets'
    NeoBundle 'Shougo/unite.vim'
    NeoBundle 'Shougo/unite-outline'
    NeoBundle 'Shougo/vimfiler'
    NeoBundle 'itchyny/lightline.vim'
    NeoBundle 'Townk/vim-autoclose'
    NeoBundle 'kana/vim-textobj-user'
    NeoBundle 'altercation/vim-colors-solarized'
    NeoBundle 'godlygeek/tabular'
    NeoBundle 'thinca/vim-quickrun'
    NeoBundleLazy 'plasticboy/vim-markdown', {
        \ "autoload" : {"filetypes" :[ "md" ]}
        \ }
    NeoBundle 't9md/vim-textmanip'
    "NeoBundle 'simeji/winresizer'
    NeoBundle 'ervandew/supertab'
    NeoBundleLazy 'scrooloose/syntastic'
    NeoBundle 'vim-scripts/vim-auto-save'
    NeoBundleLazy 'majutsushi/tagbar', {
        \ "autload": {
        \   "commands": ["TagbarToggle"],
        \ },
        \ "build": {
        \   "mac": "brew install ctags",
        \ }}

    " For Python edit
    NeoBundleLazy 'nvie/vim-flake8', {
        \ 'autoload' : {'filetypes' : ['python', 'python3'] } }
    "NeoBundleLazy 'hynek/vim-python-pep8-indent', {
    "    \ 'autoload' : {'filetypes' : ['python', 'python3'] } }
    "NeoBundleLazy 'hachibeeDI/python_hl_lvar.vim', {
    "    \ 'autoload' : {'filetypes' : ['python','python3'] } }
    "NeoBundleLazy 'davidhalter/jedi-vim', {
    "    \ 'autoload' : {'filetypes' : ['python', 'python3'] } }
    "NeoBundleLazy 'bps/vim-textobj-python', {
    ""    \ 'autoload' : {'filetypes' : ['python', 'python3'] } }
    "NeoBundle 'andviro/flake8-vim', {
    "    \ 'autoload' : {'filetypes' : ['python', 'python3'] } }
    "NeoBundleLazy 'python-mode/python-mode', {
    "    \ 'autoload' : {'filetypes' : ['python', 'python3'] } }
    "NeoBundleLazy 'vim-syntastic/syntastic', {
    "    \ 'autoload' : {'filetypes' : ['python', 'python3'] } }

    NeoBundle 'plasticboy/vim-markdown'
    NeoBundle 'kannokanno/previm'
    NeoBundle 'tyru/open-browser.vim'   

    call neobundle#end()
endif

" Installation check.
NeoBundleCheck

filetype plugin indent on
filetype indent on

" Shortcut key
nnoremap <C-t>                  :tabnew<cr>
nnoremap <C-a>                  ggVG
nnoremap <C-c>                  <C-Insert>
nnoremap <C-tab>                :tabnext<cr>
nnoremap <C-S-tab>              :tabprevious<cr>
nnoremap <silent><Leader>b      :bp<CR>
nnoremap <silent><Leader>n      :bn<CR>
nnoremap <silent><Leader>k      :bd<CR>
nnoremap <C-F4>                 :bdelete<cr>
nnoremap <F5>                   :source $MYVIMRC<CR>
nnoremap <F7>                   :<C-u>edit $MYVIMRC<CR>
nnoremap <F8>                   :<C-u>source $MYVIMRC<CR>
nnoremap <F9>                   :VimFiler -split -simple -winwidth=35 -no-quit ~<CR>
nnoremap <S-F9>                 :VimFilerBufferDir<CR>
nnoremap <F10>                  "+gP
noremap  <C-F10>                "+y
noremap  <S-F10>                "+x
nnoremap <F11>                  :QuickRun<CR>
nnoremap <silent> <Leader>o     :<C-u>Unite -vertical -no-quit outline<CR>
imap     <C-v>                  <S-Ins>

" Syntax
syntax on

" Status bar
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P

set completeopt=menuone

let g:neocomplete#enable_at_startup               = 1
let g:neocomplete#auto_completion_start_length    = 3
let g:neocomplete#enable_ignore_case              = 1
let g:neocomplete#enable_smart_case               = 1
let g:neocomplcache_enable_underbar_completion    = 1
let g:neocomplete#enable_camel_case               = 1
let g:neocomplcache_enable_auto_select            = 1
let g:neocomplcache_enable_camel_case_completion  = 1
let g:neocomplete#use_vimproc                     = 1
let g:neocomplete#sources#buffer#cache_limit_size = 1000000
let g:neocomplete#sources#tags#cache_limit_size   = 30000000
let g:neocomplete#enable_fuzzy_completion         = 1
let g:neocomplete#lock_buffer_name_pattern        = '\*ku\*'

"let g:rsenseUseOmniFunc = 1
"let g:rsenseHome = '/usr/local/lib/rsense-0.3'

" syntastic setting
" let g:syntastic_python_checkers = ['pyflakes', 'pep8']

"  let g:jedi#completions_command = "<C-Space>"    # 補完キーの設定この場合はCtrl+Space
"  let g:jedi#goto_assignments_command = "<C-g>"   # 変数の宣言場所へジャンプ（Ctrl + g)
"  let g:jedi#goto_definitions_command = "<C-d>"   # クラス、関数定義にジャンプ（Gtrl + d）
"  let g:jedi#documentation_command = "<C-k>"      # Pydocを表示（Ctrl + k）
"  let g:jedi#rename_command = "[jedi]r"
"  let g:jedi#usages_command = "[jedi]n"
"  let g:jedi#popup_select_first = 0
"  let g:jedi#popup_on_dot = 0
"
"  autocmd FileType python setlocal completeopt-=preview
"
"  " for w/ neocomplete
"    if ! empty(neobundle#get("neocomplete.vim"))
"        autocmd FileType python setlocal omnifunc=jedi#completions
"        let g:jedi#completions_enabled = 0
"        let g:jedi#auto_vim_configuration = 0
"        let g:neocomplete#force_omni_input_patterns.python =
"                        \ '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
"    endif
"endif

" auto-save
" let g:auto_save = 1

autocmd BufNewFile,BufRead *.py nnoremap <C-e> :!python %

" Inclued plugin settings
let g:vimdir = $HOME . '/.vim'

" QuickRun
let s:quickrun = expand(g:vimdir + '/quickrun.vim')
if filereadable(s:quickrun)
    source s:quickrun
endif

" Vimfiler
let s:vimfiler = expand(g:vimdir + '/vimfiler.vim')
if filereadable(s:vimfiler)
    source s:vimfiler
endif

" For neosnippet setting
" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/snippets/'
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
imap <expr><TAB>
 \ pumvisible() ? "\<C-n>" :
 \ neosnippet#expandable_or_jumpable() ?
 \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
