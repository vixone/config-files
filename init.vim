call plug#begin('~/.config/nvim/plugged')

" Navigation
 Plug 'scrooloose/nerdtree'
 Plug 'ctrlpvim/ctrlp.vim'
 Plug 'tpope/vim-fugitive'
 Plug 'mileszs/ack.vim'

 " Tools
 Plug 'tpope/vim-surround'
 Plug 'terryma/vim-multiple-cursors'
 Plug 'mattn/emmet-vim'
 Plug 'tpope/vim-commentary'

 " Editor
 Plug 'bling/vim-airline'
 Plug 'vim-airline/vim-airline-themes'
 Plug 'editorconfig/editorconfig-vim'

 " Syntax
 Plug 'jelera/vim-javascript-syntax'
 Plug 'posva/vim-vue'
 Plug 'w0rp/ale'

call plug#end()

  " vim-airline theme
 let g:airline_theme='base16_monokai'

 " UI
 syntax on
 :set number relativenumber
 :set encoding=utf8
 :set mouse=a

 " Navigation
 let mapleader = "\<Space>"
 nnoremap <leader>j <C-w>j
 nnoremap <leader>k <C-w>k
 nnoremap <leader>l <C-w>l
 nnoremap <leader>h <C-w>h
 noremap H ^
 noremap L $
 nnoremap Y y$


 " NerdTree
 " open a NERDTree automatically when vim starts up if no files were specified
 autocmd StdinReadPre * let s:std_in=1
 autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" nmap <leader>t :NERDTreeToggle<CR>

 "close vim if NERDTree is the only opened window
 autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

 " show hidden files in NerdTree
 let NERDTreeShowHidden=1

 " ctrlP
 " if executable('rg')
 "       let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
 "        let g:ctrlp_use_caching = 0
 " endif

 let g:ctrlp_custom_ignore = {
         \ 'dir': '\.git$\|node_modules\|vendor$',
         \ 'file': '.DS_Store$'
 \ }

 " ability to paste in between system and vim
 set clipboard=unnamedplus

 nmap <leader>ne :NERDTreeToggle<cr>
 nmap <leader>nf :NERDTreeFind<cr>
 nmap <leader>s  :w!<cr>
 nmap <leader>q  :q<cr>
 nmap <leader>qa :qa<cr>
 map ; :Files<CR>
 set tw=400

 nnoremap <silent> <Leader>[ :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
 nnoremap <silent> <Leader>] :exe "vertical resize " . (winwidth(0) * 2/3)<CR>

 " dd doesn't copy the deleted line
 nnoremap d "_d
 vnoremap d "_d

 " if search with / you do case insensitive search
 nnoremap / /\c

 " highlight trailing white space
 " highlight ws ctermbg=red guibg=red
 " match ws /\s\+$/

 " remove trailing white space
 nnoremap <leader>rs :%s/ \+$//ge<cr>

 " remove horizontal color column
 au BufEnter *.* :set colorcolumn=

 " add swap filesto custom directory
 set directory^=~/.config/.nvim/tmp/swap//

 " don't linebreak on split tabs
 set nowrap
 let g:ale_set_highlights = 0

 " when you want to have a laugh 
 "au CursorMoved * call system("say 'moo' &")

