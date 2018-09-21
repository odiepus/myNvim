" make it obvious where 100 characters is
set textwidth=100
" set formatoptions=cq
set formatoptions=qrn1
set wrapmargin=0
set colorcolumn=+1

" Numbers
set number
set numberwidth=5

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab



call plug#begin('~/.vim/plugged')

""" Theme / Pretty stuff
"""
" [1]
Plug 'altercation/vim-colors-solarized'
Plug 'endel/vim-github-colorscheme'
" Awesome looking meta at bottom
" Fugitive will help with git related stuff, and show branch on statusline
Plug 'tpope/vim-fugitive' | Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
""

""" Some ESSENTIAL IDE like plugins for Vim
"""
" [2] File tree viewer
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" [3]
" Several plugins to help work with Tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'https://github.com/christoomey/vim-tmux-runner'
Plug 'christoomey/vim-run-interactive'
" [5] Code highlighting and linting
Plug 'scrooloose/syntastic' "Run linters and display errors etc
Plug 'jiangmiao/auto-pairs' "MANY features, but mostly closes ([{' etc
" supertab makes tab work with autocomplete and ultisnips
Plug 'ervandew/supertab'
" For YouCompleteMe, have you installed using:
" ./install.py --tern-completer
" Provides Async autocomplete with Tern
Plug 'https://github.com/Shougo/deoplete.nvim'
Plug 'Yggdroot/indentLine'
call plug#end()

" [1]
" Color scheme
syntax enable
" let g:solarized_termcolors=16
let g:colarized_termtrans = 1
let g:solarized_termcolors=256
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
colorscheme solarized
set background=dark
" Allow powerline symbols to show up
let g:airline_powerline_fonts = 1

" [2]
map <silent> <C-n> :NERDTreeToggle<cr>
nnoremap <C-t> :call ToggleRelativeOn()<cr>
" Close vim if only NERDTree is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" [3]
" Allow moving around between Tmux windows
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
let g:tmux_navigator_no_mappings = 1
let g:tmux_navigator_save_on_switch = 1

" [10] make YCM compatible with UltiSnips (using supertab)
let g:SuperTabDefaultCompletionType = '<C-n>'

let g:deoplete#enable_at_startup = 1
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

