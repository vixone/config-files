" UI
 syntax on
 colorscheme gruvbox 
 :set termguicolors
 :set number relativenumber
 :set encoding=utf8
 :set mouse=a
 :set nowrap
 let g:indentLine_color_term = 239
 filetype plugin on

 " disable swap files
 :set noswapfile

 " vim-airline theme
 let g:airline_theme='gruvbox' 

 " ale lint
 let b:ale_fixers = ['eslint', 'prettier', 'php_cs_fixer']
 let g:ale_set_highlights = 0

 " yank to clipboard
 :set clipboard=unnamedplus

 " ================ Persistent Undo ==================
 " Keep undo history across sessions, by storing in file.
 silent !mkdir ~/.config/nvim/backups > /dev/null 2>&1
 set undodir=~/.config/nvim/backups
 set undofile

