"map
nmap <F8> :TagbarToggle<CR>
nmap <F2>  :call SwitchDirectory()<CR>
inoremap <F2> <C-O>:call SwitchDirectory()<CR>
nmap <F3> :call SwitchRelativeNumber()<CR>
inoremap <F3> <C-O>:call SwitchRelativeNumber()<CR>
nmap <F4> :call UseMouse()<CR>
inoremap <F4> <C-O>:call UseMouse()<CR>
nmap <C-k> <C-w>k
nmap <C-j> <C-w>j
nmap qq :qall<CR>
nmap 1  <C-w>h
nmap 2 <C-w>l
" nmap <buffer> <2-leftmouse> <CR>



filetype plugin indent on
set tabstop=4
set shiftwidth=4 
set noexpandtab
set number
set nuw=4 
highlight LineNr ctermfg=white


set laststatus=1
set hlsearch 
"set cursorline
"set mouse=a"



"Explore"
let g:netrw_banner = 0 
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4 
let g:netrw_altv = 1 
let g:netrw_winsize = 10 
let g:netrw_mousemaps = 1 
let g:netrw_special_syntax= 1

let g:show_directory = 0
let g:show_relative_number = 0
let g:use_mouse = 0

"Function"
function! SwitchDirectory()
	:TagbarToggle
	if g:show_directory==1 
		call CloseDirectory()
		let g:show_directory = 0
	else
		Vexplore | wincmd p
		let g:show_directory = 1
	endif
endfunction

function! CloseDirectory()
	call feedkeys("\<C-W>o") 
endfunction

function! SwitchRelativeNumber()
	if g:show_relative_number == 0
	   :set relativenumber	
	   let g:show_relative_number = 1 
	   echo "Showing relative number"

   elseif g:show_relative_number  == 1
	   :set norelativenumber
	   let g:show_relative_number = 2
	   echo "Showing line number"

   elseif g:show_relative_number == 2
	   let g:show_relative_number = 3
		:set nonumber
		echo "Cancel showing line number"

	else 
		let g:show_relative_number = 0
		:set number
		echo "Showing line number"
	endif
endfunction

function! UseMouse()
	if g:use_mouse == 0
		let g:use_mouse = 1
		:set mouse=a
		echo "Enabled mouse mode"
	else
		let g:use_mouse = 0
		:set mouse=c
		echo "Disabled mouse mode"
	endif
endfunction

augroup ProjectDrawer
	  autocmd!
	  	"autocmd VimEnter * call SwitchDirectory() 
		"| :hi CursorLine cterm=NONE ctermbg=149 guibg=149  
	    "autocmd VimEnter * call SwitchDirectory() | :hi CursorLine cterm=NONE ctermbg=149 ctermfg=16 guibg=darkred guifg=blue 
	augroup END



"Other info"
"inoremap <F2> <C-O>:call EnterVim()<CR>"
"nmap <F2> <C-O>:call ShowDirectory()<CR>"
