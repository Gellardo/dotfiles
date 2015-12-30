syntax on
set ai
set nonu
set nocp
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
"highlight 81 character:
"set textwidth=80
"set colorcolumn=+1
"hi ColorColumn guibg=#2d2d2d ctermbg=236

scriptencoding utf-8


"set list listchars=tab:╺╴,eol:¬,trail:·,extends:→,precedes:←
"˫
set list listchars=tab:∘۰,eol:¬,trail:·,extends:→,precedes:←


"set ignorecase " ignore case when searching

set background=dark

"colorscheme jammy
"colorscheme settlemyer
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

"modloader...
"execute pathogen#infect()

"syntax match Tab /\t/
"autocmd ColorScheme * highlight Tab ctermbg=darkgreen guibg=darkgreen


"highlight evilws ctermbg=red
"2match evilws /^\t*\zs \+\|[^\t]\zs\t\+\|\s\+\%#\@<!$/
" space indent /^\t*\zs \+/
" " stray tab    /[^\t]\zs\t\+/
" " trailing ws  /\s\+\%#\@<!$/

" for vim-latexsuite
filetype plugin indent on
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"
set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after
