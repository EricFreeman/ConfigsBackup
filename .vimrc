set t_Co=256
syntax on
call pathogen#runtime_append_all_bundles()
"call pathogen#infect()
colorscheme darkocean
filetype plugin indent on

set nocompatible  " We don't want vi compatibility.
set noswapfile
set autoread
set selection=exclusive

"set wildignore+=*/.git/*
"set wildignore+=.git\*

let mapleader=","
let g:ctrlp_map = '<c-p>'
let g:ctrlp_working_path_mode = 2

map <Space> :noh<CR>

imap <C-h> <C-O><C-w>h
imap <C-j> <C-O><C-w>j
imap <C-k> <C-O><C-w>k
imap <C-l> <C-O><C-w>l
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <A-k> <C-w>+
map <A-j> <C-w>-
map <A-l> <C-w>>
map <A-h> <C-w><

map <leader>x :%s/\s\+$//<CR>:noh<Cr>
map <leader>v :tabedit ~/.vimrc<CR>

map <leader><leader> :b#<cr>

map <F1> <Nop>

nmap <leader>n :NERDTreeToggle %:p:h<CR>
nmap <leader>m :NERDTreeClose<CR>:NERDTreeFind<CR>
nmap <leader>t :TlistToggle<CR>
map <leader>T 0f<ca<

noremap ;; :%s:::g<Left><Left><Left>
cmap ;\ \(\)<Left><Left>

syntax enable

set cf  " Enable error files & error jumping.
set clipboard+=unnamed  " Yanks go on clipboard instead.
set history=256  " Number of things to remember in history.
set autowrite  " Writes on make/shell commands
set ruler  " Ruler on
set nu  " Line numbers on
set nowrap  " Line wrapping off
set timeoutlen=250  " Time to wait after ESC (default causes an annoying delay)
"
"  " Formatting (some of these are for coding in C and C++)
set ts=2  " Tabs are 2 spaces
set bs=2  " Backspace over everything in insert mode
set shiftwidth=2  " Tabs under smart indent
set nocp incsearch
set hlsearch
set ignorecase
set smartcase
set cinoptions=:0,p0,t0
set cinwords=if,else,while,do,for,switch,case
set formatoptions=tcqr
set cindent
set autoindent
set smarttab
set expandtab

"   " Visual
set showmatch  " Show matching brackets.
set mat=5  " Bracket blinking.
set list
set lcs=tab:>.,trail:.,extends:#,nbsp:.
set novisualbell  " No blinking .
set noerrorbells  " No noise.
set laststatus=2
set pastetoggle=<F2>
set showcmd
set cmdheight=2

"au BufEnter * silent! lcd %:p:h
au Bufenter *.hs compiler ghc
let g:haddock_browser = "w3m"

map <F4> :execute "Ack " . expand("<cword>")<Bar> cw<CR>
map <F5> :execute "!ruby %"<CR>

:set tags=./tags;
nmap ,f :FufTag<CR>

if has('gui_running')
  set guioptions -=m
  set guioptions -=T
  set guioptions -=r
  set guioptions -=L
  set guifont=Anonymous\ Pro:h14
endif

let g:SuperTabMappingForward = '<c-space>'
let g:SuperTabMappingBackward = '<s-c-space>'

au BufRead,BufNewFile *.jade setfiletype jade
au BufRead,BufNewFile *.markdown setfiletype markdown
au BufRead,BufNewFile *.xaml setfiletype xml
au BufRead,BufNewFile *.spark setfiletype html
au BufRead,BufNewFile *.ps1 setfiletype ps1
au BufRead,BufNewFile *.scala setfiletype scala
au BufRead,BufNewFile *.less setfiletype css
au GUIEnter * set vb t_vb=

set makeprg=ruby\ %

let g:ragtag_global_maps = 1

let g:tagbar_type_javascript = {
    \ 'ctagsbin' : '~/bin/jsctags.bat'
\ }
