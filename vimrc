syntax on
set autoindent
set nonumber
set nocompatible
set noexpandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set ignorecase smartcase
set hlsearch
set ff=unix

imap jj <esc>
setlocal spell spelllang=en
"set spell
set nospell

scriptencoding utf-8

set background=dark

colorscheme ron

set t_ku=OA
set t_kd=OB
set t_kr=OC
set t_kl=OD

set termencoding=utf-8
set encoding=utf-8
set showmatch
filetype plugin on

" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo

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
filetype plugin indent on
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"
set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after


" diable beep when doing invalid stuff (either blink or do nothing
" set vb
" set vb t_vb=
