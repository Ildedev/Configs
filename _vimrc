set nocompatible
filetype off


set rtp+=$HOME/vimfiles/bundle/Vundle.vim/
call vundle#begin('$HOME/vimfiles/bundle/')
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/NERDTree'
Plugin 'flazz/vim-colorschemes'
Plugin 'PProvost/vim-ps1'
Plugin 'cd01/poshcomplete-vim'
call vundle#end()

" C Programming Standard
filetype plugin indent on
set encoding=utf-8
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set backspace=2
set splitright
set shell=powershell
set shellcmdflag-=command
set textwidth=79


" Python Programming
au BufNewFile,BufRead *.py
    \ set textwidth=79



let g:ycm_global_ycm_extra_conf= "~/.ycm_extra_conf.py"
let python_highlight_all = 1
let g:ycm_autoclose_preview_window_after_completion=1

autocmd vimenter * NERDTree
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1
let g:NERDTreeWinPos = "right"
nnoremap <C-e> :NERDTreeToggle<CR>
nnoremap <C-r> :vsplit<CR>
nmap <F2> :w<CR>
imap <F2> <ESC>:w<CR>i


colorscheme gruvbox
syntax on
set number

au GUIEnter * simalt ~x
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=l
set guioptions-=R
set guioptions-=L

hi Cursor guifg=white guibg=#851939
hi iCursor guifg=#FF9B29 guibg=#FF4D29
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=i:blinkwait10

let g:ps1_nofold_blocks=1
let g:ps1_nofold_sig=1
