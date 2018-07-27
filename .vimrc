set nocompatible              " be iMproved, required

"Colorscheme
"summerfruit256, molokai

"colorscheme molokai

"Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
" set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'klen/python-mode'
Plugin 'scrooloose/nerdtree'
Plugin 'jiangmiao/auto-pairs'
Plugin 'alvan/vim-closetag'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'edkolev/tmuxline.vim'
Plugin 'mattn/emmet-vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'jsenin/molokai'
Plugin 'kshenoy/vim-signature'
Plugin 'jsenin/semantic-highlight.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'chrisbra/csv.vim'
Plugin 'chriskempson/base16-vim'

call vundle#end()


"airline
"themes: https://github.com/vim-airline/vim-airline/wiki/Screenshots
"some: papercolor, base16, sol, molokai, solarized light, powerlineish theme,
"light, simple

set laststatus=2
let g:airline#extensions#tabline#enabled = 1
set t_Co=256
let g:airline_powerline_fonts = 1
let g:airline_theme= 'simple'
let g:user_emmet_leader_key='<C-Z>'

"sets

set mouse=a
set number
set linebreak
set mousehide
set autoindent
scriptencoding utf-8
filetype plugin on    " required
syntax on
autocmd FileType python set breakindentopt=shift:4
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set ignorecase
set hlsearch
set incsearch
set cursorline
set completeopt-=preview
let mapleader =','
set pastetoggle=<F12>
let g:pymode_folding =0
let g:pymode_trim_whitespaces =1
let g:pymode_python ='python3'
let g:pymode_doc=0
let g:pymode_virtualenv =0

noremap <f3> :Autoformat<CR>

let g:formatters_php =['phpcsfixer']
let g:formatdef_phpcsfixer ="'~/bin/php-cs-fixer fix -q -'"
let g:formatters_python =['autopep8']
let g:autoformat_verbosemode=1

noremap <F2> :NERDTreeToggle<CR>
noremap <c-X> :NERDTreeToggle<CR>

let g:ctrlp_map = '<c-p>'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_php_checkers=['php','phpcs']
let g:syntastic_php_phpcs_args='--standard=PSR2 -n'
let g:syntastic_python_checkers=['flake8']

" Exclude files or directories using Vim's wildignore:
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/venv/*,node_modules,bower_components,*.pyc   " Linux/MacOSX


"" auto trim spaces 
autocmd BufWritePre *.php :%s/\s\+$//e

"" autopairs fly mode 
let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutBackInsert = '¶'
let g:AutoPairsShortcutFastWrap= 'ł'

"" moving across splits
"" https://robots.thoughtbot.com/vim-splits-move-faster-and-more-naturally
"" control w + x -> swap bufffers order
"" control w + r -> rotate buffer"
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"" swap words, usseful for swapping params in a function call
"" http://vim.wikia.com/wiki/Swapping_characters,_words_and_line
"" nnoremap <silent> gw "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o>/\w\+\_W\+<CR><c-l>

"" http://vim.wikia.com/wiki/Using_tab_pages
"" nnoremap <C-Left> :tabprevious<CR>
"" nnoremap <C-Right> :tabnext<CR>
"" nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
"" nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . tabpagenr()<CR>

set tags=./tags,./../tags,./../../tags,./../../../tags,tags


"" semantic color
"" cambia con leader s ( ,s )
"" https://github.com/jaxbot/semantic-highlight.vim
let g:semanticEnableFileTypes = ['python']
nnoremap <Leader>s :SemanticHighlightToggle<cr>


" closetag autocierra tags para los ficheros con extensioens
let g:closetag_filenames = "*.html,*.js"





" delete back word with control + d
nmap <c-b> db
imap <c-b> <ESC>db


" easy motion permite guscar en el documento de forma muy senciall
" reemplaza a la busqueda tradiciona con la barra
" metes texto, das al enter y te deja resaltado la letra que tienes que pulsar
" para ir a ese texto
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)


" <TAB>: completion.
"

" Indentation by filetype
autocmd Filetype html setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd Filetype javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd Filetype css setlocal tabstop=2 softtabstop=2 shiftwidth=2
