set nocompatible
set encoding=utf-8

" Plugin settings
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'altercation/vim-colors-solarized'
Plug 'Raimondi/delimitMate'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'skywind3000/asyncrun.vim'
Plug 'maralla/completor.vim'
Plug 'majutsushi/tagbar'
Plug 'xolox/vim-easytags'
Plug 'xolox/vim-misc'
Plug 'Valloric/ListToggle'
Plug 'Valloric/MatchTagAlways'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'mhinz/vim-startify'
Plug 'Shougo/denite.nvim'
Plug 'haya14busa/incsearch.vim'
Plug 'othree/html5.vim'
Plug 'ap/vim-css-color'
Plug '907th/vim-auto-save'
Plug 'w0rp/ale'
Plug 'StanAngeloff/php.vim'
call plug#end()

" Plugin settings
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_solarized_bg='light'
let g:airline_powerline_fonts=1
let g:UltiSnipsUsePythonVersion=3
let g:UltiSnipsExpandTrigger="<tab>"
autocmd FileType python let b:delimitMate_nesting_quotes = ['"'] " Python docstring handle
let g:completor_python_binary='/usr/bin/python3'
let g:completor_clang_binary='/usr/bin/clang'
let g:completor_php_omni_trigger='([$\w]+|use\s*|->[$\w]*|::[$\w]*|implements\s*|extends\s*|class\s+[$\w]+|new\s*)$'
let g:airline_exclude_preview=1 " Make powerline shows after window split
let g:lt_location_list_toggle_map='\l'
let g:lt_quickfix_list_toggle_map='\p'
let g:tagbar_autofocus=1
let g:tagbar_autoclose=1
let g:tagbar_compact=1
let g:tagbar_map_showproto='<Space><Space>'
let g:auto_save=1
let g:auto_save_events=["CursorHold"]
let g:ale_open_list=1
let g:ale_keep_list_window_open=0
let g:ale_lint_on_save=1
let g:ale_lint_on_text_changed='never'
let g:NERDTreeShowHidden=1
let g:NERDTreeMinimalUI=1
let g:mta_use_matchparen_group=1
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
" Auto toggle QuickFix after AsyncRun
augroup vimrc
  autocmd QuickFixCmdPost * call asyncrun#quickfix_toggle(10, 1)
augroup END
" Change file_rec command
call denite#custom#var('file_rec', 'command',
\ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])

" Theme settings
let g:solarized_termcolors=256 " To compatible with some terminal emulators
syntax enable
set background=light
colorscheme solarized

" Editor settings
set noshowmode
set showcmd
set nowrap
set hlsearch
set ttimeoutlen=10 " No pause when switching from INSERT to NORMAL
set number " Line number
set backspace=2 " Make backspace work like in most apps
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
autocmd FileType python setlocal et sta shiftwidth=4 softtabstop=4 tabstop=4 " For Python indent

" Command and key mappings
let mapleader = "\<Space>"
nnoremap q @q
nnoremap <Leader>s :w<CR>
nnoremap <Leader>q :q!<CR>
nnoremap <Leader><Tab> <C-w>w
nnoremap <Leader><Up> <C-w>k
nnoremap <Leader><Down> <C-w>j
nnoremap <Leader><Left> <C-w>h
nnoremap <Leader><Right> <C-w>l
nnoremap \q :qa!<CR>
nnoremap \\ :let<Space>@/=""<CR>
nnoremap \- :bprevious<CR>
nnoremap \= :bNext<CR>
nnoremap \' :AsyncRun<Space>-cwd=%:p:h<Space>
nnoremap \; :source %<CR>
nnoremap \[ :Denite file_rec<CR>
nnoremap \] :TagbarToggle<CR>
nnoremap <C-t> :enew<CR>
nnoremap <C-w> :bdelete<CR>
