scriptencoding utf-8

set number
set nocompatible
set autoindent
set noexpandtab tabstop=4 softtabstop=4 shiftwidth=4 shiftround
set ignorecase smartcase hlsearch

imap jj <esc>
setlocal spell spelllang=en
set nospell

set termencoding=utf-8
set encoding=utf-8
filetype plugin on
filetype plugin indent on
syntax on
set showmatch

" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo

" Reset cursor to old position from previous time
function! ResCur()
	if line("'\"") <= line("$")
		normal! g`"
		return 1
	endif
endfunction
augroup resCur
	autocmd!
	autocmd BufWinEnter * call ResCur()
augroup END

" for vim-latexsuite
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"
" for all tex files, break words correctly if end of line is reached
autocmd FileType tex setlocal linebreak


" diable beep when doing invalid stuff (either blink or do nothing
set vb t_vb=

" enable mouse integration
set mouse=a
set ttymouse=urxvt

"""""""""""
" Plugins "
"""""""""""
call plug#begin('~/.vim/plugged')
    Plug 'junegunn/vim-plug'

    " nicer way for file system exploring
    Plug 'scrooloose/nerdtree'
    " Linting and make from vim
    "Plug 'benekastah/neomake'
    " colorscheme
    Plug 'altercation/vim-colors-solarized'

    "nicer statusline
    Plug 'itchyny/lightline.vim'

    Plug 'bitc/vim-bad-whitespace'
    " git integration
    Plug 'tpope/vim-fugitive'
    Plug 'JuliaLang/julia-vim'

	Plug 'fatih/vim-go'

call plug#end()

" lightline related
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ }

set background=dark
colorscheme solarized
