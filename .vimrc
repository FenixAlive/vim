set nocompatible              " be iMproved, required

"Colorscheme
"summerfruit256, molokai, snow, artesanal

colorscheme artesanal

"Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.vim-plugins/LanguageClient-neovim

call vundle#begin()
"hace este codigo posible para agregar plugins
Plugin 'VundleVim/Vundle.vim'
"hace mas facil buscar un archivo y abrirlo <c-p>
Plugin 'kien/ctrlp.vim'
Plugin 'klen/python-mode'
"abre arbol con <c-x> o f2
Plugin 'scrooloose/nerdtree'
Plugin 'jiangmiao/auto-pairs'
Plugin 'alvan/vim-closetag'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'edkolev/tmuxline.vim'
"<c-a>,
Plugin 'mattn/emmet-vim'
"revisa codigo al guardar
Plugin 'vim-syntastic/syntastic'
"agrega color molokai
Plugin 'jsenin/molokai'
"toogle, display and navigate marks
Plugin 'kshenoy/vim-signature'
"semantic colorea cada palabra de distinto color con <leader>s
Plugin 'jsenin/semantic-highlight.vim' 
"al buscar algo con / o <leader><leader> le pone letras a las palabras encontradas para ir a ellas
Plugin 'easymotion/vim-easymotion'
Plugin 'chrisbra/csv.vim'
Plugin 'chrisbra/unicode.vim'
"agrega, cambia y elimina surrounds characters cs<leader> ys<leader> ds<leader> en visual mode S
Plugin 'tpope/vim-surround'
"autocompleta sin apretar <c-p> en insert mode
Plugin 'AutoComplPop'
"check errors
Plugin 'dense-analysis/ale'
"cliente de lenguaje clientlanguaje-neovim lo instale manualmente
call vundle#end()

"sets

filetype plugin on    " required
syntax on

let mapleader =","

set mouse=a
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

"corta una linea larga por palabras si se puede"
set linebreak 
"oculta el mouse al escribir en gvim"
set mousehide 
set autoindent
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

set ignorecase "Hace insensible la busqueda"
"resalta las busquedas hechas con / y doble <esc> las quita
set hlsearch 
nnoremap <ESC><ESC> :silent! nohls<cr>
inoremap jk <esc>
"va llendose a la busqueda conforme tecleas no trabaja con easymotion
set incsearch 
"colorea la linea en lugar de underline
set cursorline
"abre ventana de completado estaba en preview <c-p> en insert mode
"completar con ale
let g:ale_completion_enabled = 1

" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1
"configura servidor-cliente rls
"
" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    \ 'python': ['/usr/local/bin/pyls'],
    \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
    \ }

nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

"completado
set completeopt=menuone,preview,longest

inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <RIGHT> pumvisible() ? "<C-y>" : "<RIGHT>"
inoremap <expr> <l> pumvisible() ? "<C-y>" : "<l>"
inoremap <expr> <LEFT> pumvisible() ? "<C-e>" : "<LEFT>"
inoremap <expr> <h> pumvisible() ? "<C-e>" : "<h>"
inoremap <expr> <UP> pumvisible() ? "<C-p>": "<UP>"
inoremap <expr> <k> pumvisible() ? "<C-p>": "<k>"
inoremap <expr> <DOWN> pumvisible() ? "<C-n>": "<DOWN>"
inoremap <expr> <j> pumvisible() ? "<C-n>": "<j>"

scriptencoding utf-8
autocmd FileType python set breakindentopt=shift:4

set pastetoggle=<F12>
let g:pymode_folding =0
let g:pymode_trim_whitespaces =1
let g:pymode_python ='python3'
let g:pymode_doc=0
let g:pymode_virtualenv =1

"airline
"themes: https://github.com/vim-airline/vim-airline/wiki/Screenshots
"some: papercolor, base16, sol, molokai, solarized light, powerlineish theme,
"light, simple

set laststatus=2
let g:airline#extensions#tabline#enabled = 1
set t_Co=256
let g:airline_powerline_fonts = 1
let g:airline_theme= 'light'

"para usar emmet <c-a>,
let g:user_emmet_leader_key='<c-a>'

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
let g:syntastic_check_on_wq = 1
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
"nnoremap <C-L> <C-W><C-L>
"nnoremap <C-H> <C-W><C-H>
"nnoremap <C-J> <C-W><C-J>
"nnoremap <C-K> <C-W><C-K>

" move among buffers with CTRL-shift
noremap <C-H> :bprev<CR>
noremap <C-K> :bfirst<CR>
noremap <C-J> :blast<CR>
noremap <C-L> :bnext<CR>
nnoremap <leader>bb :buffers<cr>:b<space>
nnoremap <leader><tab> :b#<cr>

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
"" cambia con leader s ( <leader>s )
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

" Indentation by filetype
autocmd Filetype html setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd Filetype javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd Filetype css setlocal tabstop=2 softtabstop=2 shiftwidth=2

