"----------------------------------"
" Jason Ma .VIMRC 07-17-17         "
"----------------------------------"

"[General]--------------------------------------------------------------------"
set nocompatible                   " get rid of strict vi compatibility!
set autoindent                     " autoindent on
set noerrorbells                   " bye bye bells :)
set nowrap                         " no wrapping!
set backspace=indent,eol,start     " backspace over everything
set fileformats=unix,dos,mac       " open files from mac/dos
set exrc                           " open local config files
set nojoinspaces                   " don't add white space when unneeded
set bs=2                           " fix backspacing in insert mode

"[UI]-------------------------------------------------------------------------"
syntax on                          " turns syntax on
colorscheme JAM256                 " sets coloring scheme
set nu                             " line numbering on
set ruler                          " which line am I on?
set cursorline                     " highlights current line
set cc=80                          " red line 80 at 80 character mark
set modeline                       " show what I'm doing
set showmode                       " show the mode on the dedicated line
set showmatch                      " highlights matching [], {}, ()
set wildmenu                       " visual autocomplete for command menu
set lazyredraw                     " redraws only when needed
set columns=84                     " causes vim incompatability
"setlocal textwidth=80             " used for text wrapping
set gfn=Monospace\ 8               " set font and font size

"[Searching]------------------------------------------------------------------"
set incsearch                      " searches as characters are entered
set hlsearch                       " highlights matches
set ignorecase                     " search without regards to case

"[Folding]--------------------------------------------------------------------"
set foldenable                     " enable folding
set foldlevelstart=10              " open most folds by default
set foldnestmax=10                 " 10 nested fold max
set foldmethod=indent              " folds based on indent level

"[Tabs]-----------------------------------------------------------------------"
au BufRead,BufNewFile *.{c,h,cpp,hpp,java,py} set expandtab
au BufRead,BufNewFile *.{c,h,cpp,hpp,java,py} set shiftwidth=2
au BufRead,BufNewFile *.{c,h,cpp,hpp,java,py} set tabstop=2
au BufRead,BufNewFile *.s set noexpandtab
au BufRead,BufNewFile *.s set shiftwidth=8
au BufRead,BufNewFile *.s set tabstop=8

"[Binds]----------------------------------------------------------------------"
" For switching between many opened file by using ctrl+l or ctrl+h
map <C-J> :next <CR>
map <C-K> :prev <CR>
" Spelling toggle via F10 and F11
map <F10> <Esc>setlocal spell spelllang=en_us<CR>
map <F11> <Esc>setlocal nospell<CR>

"[Custom Functions]-----------------------------------------------------------"
function PyFileHead()
	let s:line=line(".")
	call setline(s:line,    "'''*-----------------------------------------------------------------------*---")
	call append (s:line,    "                                                         Author: Jason Ma")
	call append (s:line+1,  "                                                         Date  : " .strftime("%b %d %Y"))
	call append (s:line+2,  "                                      TODO")
	call append (s:line+3,  "")
	call append (s:line+4,  "   File Name  : " .expand("%"))
	call append (s:line+5,  "   Description: TODO")
	call append (s:line+6,  "---*-----------------------------------------------------------------------*'''")
	call append (s:line+7,  "")
	call append (s:line+8,  "")
	unlet s:line
endfunction

function CFileHead()
	let s:line=line(".")
	call setline(s:line,    " /*****************************************************************************")
	call append (s:line,    "")
	call append (s:line+1,  "                                                         Author: Jason Ma")
	call append (s:line+2,  "                                                         Date:   " .strftime("%b %d %Y"))
	call append (s:line+3,  "                                      TODO")
	call append (s:line+4,  "")
	call append (s:line+5,  " File Name:       " .expand("%"))
	call append (s:line+6,  " Description:     TODO")
	call append (s:line+7,  " *****************************************************************************/")
	call append (s:line+8,  "")
	call append (s:line+9,  "")
	unlet s:line
endfunction

function CFuncHead()
let s:line=line(".")
	call setline(s:line,    " /********************************************************************")
	call append (s:line,    "   Routine Name: TODO")
	call append (s:line+1,  "   File:         " .expand("%"))
	call append (s:line+2,  "   ")
	call append (s:line+3,  "   Description: TODO")
	call append (s:line+4,  "   ")
	call append (s:line+5,  "   Parameter Descriptions:")
	call append (s:line+6,  "   name               description")
	call append (s:line+7,  "   ------------------ -----------------------------------------------")
	call append (s:line+8,  "   TODO")
	call append (s:line+9,  " ********************************************************************/")
	unlet s:line
endfunction

function PyFuncHead()
let s:line=line(".")
	call setline(s:line,     "'''[TODO]----------------------------------------------------------------------")
	call append (s:line,     "  TODO")
	call append (s:line+1,   "----------------------------------------------------------------------------'''")
	unlet s:line
endfunction

imap <F2> <ESC>mz:execute PyFileHead()<CR>`z8jA
imap <F3> <ESC>mz:execute PyFuncHead()<CR>`z1jA
imap <F4> <ESC>mz:execute CFileHead()<CR>`z10jA
imap <F5> <ESC>mz:execute CFuncHead()<CR>`z4jA

