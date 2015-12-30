" syntax highlighting
syntax enable
set number

" insert mode
imap jj <esc>

" tab handling
set tabstop=4

" plugins
call plug#begin('~/.config/nvim/plugged')

    " nicer way for file system exploring
    Plug 'scrooloose/nerdtree'
    " Linting and make from vim
    Plug 'benekastah/neomake'
    " colorscheme
    Plug 'altercation/vim-colors-solarized'

	"nicer statusline
    Plug 'itchyny/lightline.vim'

    Plug 'bitc/vim-bad-whitespace'
	" git integration
	Plug 'tpope/vim-fugitive'

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


" colors
set background=dark
colorscheme solarized
