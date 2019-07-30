 """"""""""""""""""""""""""""
 """"""""""""""""""""""""""""
 """""" Vue Syntax Highlight
 """"""""""""""""""""""""""""
 """"""""""""""""""""""""""""
 autocmd FileType vue syntax sync fromstart

 """"""""""""""""""""""""""""
 """"""""""""""""""""""""""""
 """""" NerdCommenter
 """"""""""""""""""""""""""""
 """"""""""""""""""""""""""""
 let g:NERDSpaceDelims = 2
 " Use compact syntax for prettified multi-line comments
 let g:NERDCompactSexyComs = 0
 " Align line-wise comment delimiters flush left instead of following code indentation
 let g:NERDDefaultAlign = 'left'
 " Allow commenting and inverting empty lines (useful when commenting a region)
 let g:NERDCommentEmptyLines = 1
 " Enable trimming of trailing whitespace when uncommenting
 let g:NERDTrimTrailingWhitespace = 1
 " Special hook for vuejs files
 let g:ft = ''
 function! NERDCommenter_before()
	 if &ft == 'vue'
		 let g:ft = 'vue'
		 let stack = synstack(line('.'), col('.'))
		 if len(stack) > 0
			 let syn = synIDattr((stack)[0], 'name')
			 if len(syn) > 0
				 exe 'setf ' . substitute(tolower(syn), '^vue_', '', '')
			 endif
		 endif
	 endif
 endfunction
 function! NERDCommenter_after()
	 if g:ft == 'vue'
		 setf vue
		 let g:ft = ''
	 endif
 endfunction

 """"""""""""""""""""""""""""
 """"""""""""""""""""""""""""
 """"""" NerdTree  
 """"""""""""""""""""""""""""
 """"""""""""""""""""""""""""

 " open a NERDTree automatically when vim starts up if no files were specified
 autocmd StdinReadPre * let s:std_in=1
 autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

 " close vim if NERDTree is the only opened window
 autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

 " show hidden files in NerdTree
 let NERDTreeShowHidden=1

 """"""""""""""""""""""""""""
 """"""""""""""""""""""""""""
 """"""" ctrlP 
 """"""""""""""""""""""""""""
 """"""""""""""""""""""""""""
 " rg setup to search quicker
 " $ brew install rg
 if executable('rg')
         let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
         let g:ctrlp_use_caching = 0
 endif

 let g:ctrlp_custom_ignore = {
         \ 'dir': '\.git$\|node_modules|vendor$',
         \ 'file': '.DS_Store$'
 \ }
