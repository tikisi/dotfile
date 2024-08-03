syntax on
set number
set title
set fenc=utf-8
set belloff=all

" ファイルの末尾に改行を加えない
set nofixeol

" バックアップファイルを作らない
set nobackup
set noswapfile

" 編集中に変更があったら再読み込み
set autoread

" clipboard(WSLでクリップボードを有効化)
set clipboard&
set clipboard^=unnamedplus

" tab系
set smartindent
set expandtab
set tabstop=4
set shiftwidth=4

" search 
set incsearch   " インクリメンタルサーチ, 1文字入力ごとに検索を行う
set ignorecase  " 検索パターンに大文字小文字を区別しない
set hlsearch    " 検索結果をハイライト

"backspace
set backspace=indent,eol,start
noremap! <C-?> <C-h>

" 全角スペースの背景を白に変更
autocmd Colorscheme * highlight FullWidthSpace ctermbg=white
autocmd VimEnter * match FullWidthSpace /　/

" Makefile
let _curfile=expand("%:r")
if _curfile == 'Makefile'
  set noexpandtab
endif

" Theme
colorscheme elflord

" StatusLineの設定
set laststatus=2    " 各ウィンドウにステータスラインを表示(Vim8.1以降)
set statusline=%F
highlight StatusLine term=NONE cterm=NONE guifg=red ctermfg=lightblue ctermbg=black " アクティブなウィンドウのステータスライン
highlight StatusLineNC term=NONE cterm=NONE guifg=red ctermfg=white ctermbg=black " 非アクティブなウィンドウのステータスライン

