" syntax highlighting
syntax enable
set number

" insert mode
imap jj <esc>

" tab handling
set noexpandtab tabstop=4 softtabstop=4 shiftwidth=4 shiftround

" buffer handling
set path+=** " autocomplete files from all subdirs
set confirm " ask before leaving modified buffer whether to drop changes or save

" close Omni-Completion tip window when a selection is made
" also possible: use CompleteDone (without if) or CursorMovedI
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" ft things
let g:tex_flavor = "latex"
autocmd FileType tex set spell


"""""""""""""""""""""""""""""""
" plugins
"""""""""""""""""""""""""""""""
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim
	    \ --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')

    " nicer way for file system exploring
    Plug 'scrooloose/nerdtree'
    " Linting and make from vim
    Plug 'benekastah/neomake'
    " colorscheme
    "Plug 'altercation/vim-colors-solarized'

	"nicer statusline
    Plug 'itchyny/lightline.vim'

    Plug 'bitc/vim-bad-whitespace'
	" git integration
	Plug 'tpope/vim-fugitive'

	Plug 'fatih/vim-go'
	Plug 'lervag/vimtex'
call plug#end()

" neovim config
let g:neomake_open_list=2 " open new split with output
let g:neomake_error_sign={'text': '* ', 'texthl': 'Error'}
let g:neomake_warning_sign={'text': '* ', 'texthl': 'Comment'}
" run neomake on every write
"autocmd! BufWritePost * Neomake

" lightline config
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified' ] ],
	  \   'right': [ [ 'lineinfo' ],
	  \            [ 'percent' ],
      \            [ 'filetype' ] ]
      \ },
      \}
set noshowmode

" vim-go config
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1


" colors
set background=dark
"colorscheme solarized
