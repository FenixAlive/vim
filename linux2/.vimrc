" Instalar Plug-Vim si no lo está
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
"iniciar Plug-vim
call plug#begin('~/.vim/plugged')
 Plug 'itchyny/lightline.vim'
call plug#end()

"lightline
set laststatus=2
if !has('gui_running')
  set t_Co=256
endif
set noshowmode

let g:lightline = {
      \ 'colorscheme': 'OldHope',
      \ }

"colorscheme
colorscheme old-hope


