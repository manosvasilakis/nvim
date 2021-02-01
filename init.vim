" ██╗   ██╗██╗███████╗██╗   ██╗ █████╗ ██╗
" ██║   ██║██║██╔════╝██║   ██║██╔══██╗██║
" ██║   ██║██║███████╗██║   ██║███████║██║
" ╚██╗ ██╔╝██║╚════██║██║   ██║██╔══██║██║
"  ╚████╔╝ ██║███████║╚██████╔╝██║  ██║███████╗
"   ╚═══╝  ╚═╝╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝
" ███████╗██████╗ ██╗████████╗ ██████╗ ██████╗	     ██╗   ██╗██╗
" ██╔════╝██╔══██╗██║╚══██╔══╝██╔═══██╗██╔══██╗	     ██║   ██║██║
" █████╗  ██║  ██║██║   ██║   ██║   ██║██████╔╝	     ██║   ██║██║
" ██╔══╝  ██║  ██║██║   ██║   ██║   ██║██╔══██╗	     ╚██╗ ██╔╝██║
" ███████╗██████╔╝██║   ██║   ╚██████╔╝██║  ██║	      ╚████╔╝ ██║
" ╚══════╝╚═════╝ ╚═╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝	       ╚═══╝  ╚═╝
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
	" Generic
	Plug 'mbbill/undotree'                  " Useful emacs bloat
	Plug 'matze/vim-move'			" Drag Lines Arround suckit VScode
	Plug 'terryma/vim-multiple-cursors'     " :)
	Plug 'junegunn/fzf', {'dir': '~/.local/share/fzf','do': './install --all'}
	Plug 'junegunn/fzf.vim'                 " needed for previews
	Plug 'antoinemadec/coc-fzf', {'branch': 'release'}
	Plug 'vimwiki/vimwiki'                  " Until org mode, will do the trick. ,ww -
	Plug 'dhruvasagar/vim-table-mode'       " Easy Ascii Tables. ,tm -
	Plug 'KabbAmine/vCoolor.vim'            " Color Picker
	" Polishing
	Plug 'gruvbox-community/gruvbox'	" best colorscheme known to human
	Plug 'scrooloose/nerdtree'		" files tree
	Plug 'ryanoasis/vim-devicons'		" Devicons VScode suckit
	Plug 'norcalli/nvim-colorizer.lua'      " Display Colors
	Plug 'junegunn/goyo.vim'		" Distraction-free writing in Vim
call plug#end()

" Vim Essential Settings
source ~/.config/nvim/modules/editor-conf.vim

" Plugin Configuration Modules
"" Programming Modules
source ~/.config/nvim/modules/coc-conf.vim
source ~/.config/nvim/modules/emmet-conf.vim

"" Text Manipulation & Movements
source ~/.config/nvim/modules/undotree-conf.vim
source ~/.config/nvim/modules/vimtablemode-conf.vim

"" Polishing
source ~/.config/nvim/modules/gruvbox-conf.vim
source ~/.config/nvim/modules/nerdtree-conf.vim

"" Other configurations that do not need a custom file
source ~/.config/nvim/modules/other-conf.vim
