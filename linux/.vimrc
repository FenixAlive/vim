"https://github.com/FenixAlive/vim

if &compatible
  set nocompatible
endif

"Plug-vim
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
  Plug 'itchyny/lightline.vim'
  Plug 'preservim/nerdcommenter'
  Plug 'mattn/emmet-vim'
  Plug 'tpope/vim-surround'
  Plug 'vifm/vifm.vim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

set encoding=utf-8
scriptencoding utf-8

"custom
let mapleader =","
inoremap jk <ESC>
set pastetoggle=<F12>

"historia al cerrar archivo
set undofile
set undodir=~/.vim/.undo//
set directory=~/.vim/.swp//

"mouse
set mouse=a
set mousehide

"busqueda
set ignorecase "Hace insensible la busqueda"
set hlsearch 
set incsearch 
nnoremap <silent><ESC><ESC> :nohls<CR>

"lightline: A partir de active es para coc
set laststatus=2
if !has('gui_running')
  set t_Co=256
endif
let g:lightline = {
	\'colorscheme': 'OldHope',
	\ 'active': {
	\   'left': [ [ 'mode', 'paste' ],
	\             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
	\ },
	\ 'component_function': {
	\   'cocstatus': 'coc#status'
	\ },
	\}
set noshowmode

"Color en vim
colorscheme old-hope

"emmet-vim
let g:user_emmet_leader_key='<C-a>'

"Vifm abrir buscador de archivos
map <leader>xx :Vifm<CR>
map <leader>xv :VsplitVifm<CR>
map <leader>xh :SplitVifm<CR>
map <leader>xd :DiffVifm<CR>
map <leader>xt :TabVifm<CR>

"mover por divisiones
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>

"ir a buffer
nnoremap <leader>bb :buffers<CR>:b
nnoremap <leader><tab> :b#<CR>

"linea
set cursorline
set linebreak
set autoindent
set tabstop=2

"numeracion
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END:set number relativenumber

""""" coc config
"una vez instalado nodejs, npm y coc en vim agregar los siguientes paquetes:
"Rust:
"en terminal agregar servidor:
"rustup component add rls rust-analysis rust-src
"en vim agregar la extensión:
":CocInstall coc-rls
":CocInstall coc-analyzer
" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" prettier command for coc
command! -nargs=0 Prettier :CocCommand prettier.formatFile

let g:coc_global_extensions = [
	\ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ ]

" from readme
" if hidden is not set, TextEdit might fail.
set hidden 
" Some servers have issues with backup files, see #649 set nobackup set nowritebackup " Better display for messages set cmdheight=2 " You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c

"always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
" Use <CR> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <CR> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<CR>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<CR>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<CR>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<CR>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<CR>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

"instrucciones:
"Para moverse entre tabs gt o gT
