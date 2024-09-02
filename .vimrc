synta on
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

" clipboard
set clipboard+=unnamed

" tab系
set smartindent
set expandtab
set tabstop=4
set shiftwidth=4

" search 
set incsearch   " インクリメンタルサーチ, 1文字入力ごとに検索を行う
set ignorecase  " 検索パターンに大文字小文字を区別しない
set hlsearch    " 検索結果をハイライト

"backspaceでの文字削除に対応
set backspace=indent,eol,start
noremap! <C-?> <C-h>

" 全角スペースの背景を白に変更
autocmd Colorscheme * highlight FullWidthSpace ctermbg=white
autocmd VimEnter * match FullWidthSpace /　/

" Makefile時に(tabstop=4)を停止
let _curfile=expand("%:r")
if _curfile == 'Makefile'
  set noexpandtab
endif

colorscheme elflord

" add filename status
set laststatus=2
set statusline=%F
highlight StatusLine term=NONE cterm=NONE guifg=red ctermfg=lightblue ctermbg=black " アクティブなウィンドウのステータスライン
highlight StatusLineNC term=NONE cterm=NONE guifg=red ctermfg=white ctermbg=black " 非アクティブなウィンドウのステータスライン

