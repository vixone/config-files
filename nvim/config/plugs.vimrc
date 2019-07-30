call plug#begin('~/.config/nvim/plugged')

" Themes
 Plug 'dracula/vim', { 'as': 'dracula' }

 " Navigation
 Plug 'scrooloose/nerdtree'
 Plug 'ctrlpvim/ctrlp.vim'
 Plug 'tpope/vim-fugitive'
 Plug 'rking/ag.vim'

 " Tools
 Plug 'tpope/vim-surround'
 Plug 'terryma/vim-multiple-cursors'
 Plug 'mattn/emmet-vim'
 Plug 'scrooloose/nerdcommenter'

 " Editor
 Plug 'bling/vim-airline'
 Plug 'vim-airline/vim-airline-themes'
 Plug 'editorconfig/editorconfig-vim'
 Plug 'yggdroot/indentline'
 Plug 'w0rp/ale'

 " Syntax
 Plug 'pangloss/vim-javascript'
 Plug 'posva/vim-vue'
 Plug 'mxw/vim-jsx'
 Plug 'StanAngeloff/php.vim'

 call plug#end()
