set number
set et
set gfn=Menlo:h13
set lines=54
set tabstop=4
set shiftwidth=4
set expandtab!
set background=dark
set hlsearch
set incsearch
set nocompatible
set ruler
set laststatus=2
set showcmd
set showmode
set autoindent
" set listchars=tab:▸\ ,eol:¬
set list
set t_Co=256

filetype indent on

if exists("syntax_on")
	syntax reset
endif

colorscheme blue

if has("gui_running")
	set guioptions=egmrt
	set cc=80
end

map ,p :!pdflatex % &
map ,b :!bibtex % &
map ,v :!open %<.pdf &
map ,t :w !pdflatex % &
au BufNewFile,BufRead *.less set filetype=less

call pathogen#infect()

" Some Linux distributions set filetype in /etc/vimrc.
" Clear filetype flags before changing runtimepath to force Vim to reload them.
filetype off
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim
filetype plugin indent on
syntax on
filetype plugin on
