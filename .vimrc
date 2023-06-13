syntax on
set number
set title
set fenc=utf-8

" ファイルの末尾に改行を加えない
set nofixeol

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

"backspace
set backspace=indent,eol,start

" 全角スペースの背景を白に変更
autocmd Colorscheme * highlight FullWidthSpace ctermbg=white
autocmd VimEnter * match FullWidthSpace /　/
colorscheme desert
