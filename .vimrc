syntax on
set number
set title
set fenc=utf-8
set belloff=all

" バックアップファイルを作らない
set nobackup
set noswapfile

" 編集中に変更があったら再読み込み
set autoread

" tab系
set smartindent
set expandtab
set tabstop=4
set shiftwidth=4

" search 
set ignorecase
set smartcase
set hlsearch

"backspace
set backspace=indent,eol,start
noremap! <C-?> <C-h>

" 全角スペースの背景を白に変更
autocmd Colorscheme * highlight FullWidthSpace ctermbg=white
autocmd VimEnter * match FullWidthSpace /　/
colorscheme desert

" Makefile
let _curfile=expand("%:r")
if _curfile == 'Makefile'
  set noexpandtab
endif
