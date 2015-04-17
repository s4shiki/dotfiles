if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" インストール済みプラグイン
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!
" カラースキーム一覧表示に Unite.vim  を使う
NeoBundle 'Shougo/unite.vim'
NeoBundle 'ujihisa/unite-colorscheme'
" NERDTreeディレクトリのツリー表示
NeoBundle 'scrooloose/nerdtree'
" emmet-vim
NeoBundle 'mattn/emmet-vim'

call neobundle#end()

" Required:
filetype plugin indent on
filetype indent on
syntax on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
set number "行番号表示

"タブを空白2つに
set tabstop=2
set autoindent
set expandtab
set shiftwidth=2

" tmuxコピペ用
set clipboard+=unnamed
set clipboard+=autoselect

"タブ、空白、改行の可視化
set list
set listchars=tab:>.,trail:_,eol:↲,extends:>,precedes:<,nbsp:%

""全角スペースをハイライト表示
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction

if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    autocmd ColorScheme       * call ZenkakuSpace()
    autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
  augroup END
  call ZenkakuSpace()
endif

""Linuxの場合はviminfoを用いてヤンクデータを共有
let OSTYPE = system('uname')
if OSTYPE == "Linux\n"
  noremap y y:wv<CR>
  noremap p :rv!<CR>p
endif

set viminfo='50,\"3000,:0,n~/.viminfo
