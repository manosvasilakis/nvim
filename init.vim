let mapleader = ","

" Get Plug
" source ~/.config/nvim/modules/get-plug.vim

" Plug the Plugins
call plug#begin('~/.config/nvim/plugged')
	" Programming
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'mattn/emmet-vim'			" Emmet Snippets
	Plug 'tpope/vim-commentary' 		" Comment stuff out. gcc - gc - gcap - etc...
	Plug 'tpope/vim-surround'               " cs[{, ds', ysW(, ...
	Plug 'turbio/bracey.vim'		" Live Server
	" Generic
	Plug 'junegunn/fzf.vim'			" Fuzzy Finder fzf
	Plug 'matze/vim-move'			" Drag Lines Arround suckit VScode
	" Polishing
	Plug 'gruvbox-community/gruvbox'	" best colorscheme known to human
	Plug 'frazrepo/vim-rainbow'             " colorful brackets
	Plug 'vim-airline/vim-airline'		" statusbar
	Plug 'scrooloose/nerdtree'		" files tree
	Plug 'ryanoasis/vim-devicons'		" Devicons VScode suckit
	Plug 'junegunn/goyo.vim'		" Distraction-free writing in Vim
call plug#end()

" Vim Essentials
source ~/.config/nvim/modules/editor-conf.vim
source ~/.config/nvim/modules/hacks-conf.vim

" Plugin Configuration Modules
"" Programming
source ~/.config/nvim/modules/coc-conf.vim
source ~/.config/nvim/modules/emmet-conf.vim

"" Text Manipulation & Movements
source ~/.config/nvim/modules/fzf-conf.vim
source ~/.config/nvim/modules/vimmove-conf.vim

"" Polishing
source ~/.config/nvim/modules/gruvbox-conf.vim
source ~/.config/nvim/modules/rainbow-conf.vim
source ~/.config/nvim/modules/airline-conf.vim
source ~/.config/nvim/modules/nerdtree-conf.vim
