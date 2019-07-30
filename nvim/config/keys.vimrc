 let mapleader = "\<Space>"

 " move start/end of line
 noremap H ^
 noremap L $
	
 " save and quit
 nmap <leader>s  :w!<cr>
 nmap <leader>q  :q<cr>

 " remap arrow keys
 nnoremap <silent> <Left> :bprev<CR>
 nnoremap <silent> <Right> :bnext<CR>
 nnoremap <silent> <Up> :BufOnly<CR>
 nnoremap <silent> <Down> :e#<CR>

 " Navigation
 nnoremap <leader>j <C-w>j
 nnoremap <leader>k <C-w>k
 nnoremap <leader>l <C-w>l
 nnoremap <leader>h <C-w>h

 " re-open last opened file
 nmap <leader>ff :e#<cr>

 " swap first focused window with second focused window
 function! WinBufSwap()
   let thiswin = winnr()
   let thisbuf = bufnr("%")
   let lastwin = winnr("#")
   let lastbuf = winbufnr(lastwin)
 
   exec  lastwin . " wincmd w" ."|".
       \ "buffer ". thisbuf ."|".
       \ thiswin ." wincmd w" ."|".
       \ "buffer ". lastbuf
 endfunction

 command! Wswap :call WinBufSwap()
 map <Leader>bs <C-c>:call WinBufSwap()<CR>

 " resize current buffer window 
 nnoremap <silent> <Leader>[ :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
 nnoremap <silent> <Leader>] :exe "vertical resize " . (winwidth(0) * 2/3)<CR>

 " dd doesn't copy the deleted line
 nnoremap d "_d
 vnoremap d "_d

 " if search with / you do case insensitive search
 nnoremap / /\c

 " remove trailing white space
 nnoremap <leader>rs :%s/ \+$//ge<cr>

 " nerdtree stuff
 nmap <leader>ne :NERDTreeToggle<CR>
 nmap <leader>nf :NERDTreeFind<CR>
