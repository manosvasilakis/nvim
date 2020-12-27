" ---- Make the editor usable in 2020 ----
set nocompatible
" Encoding
set encoding=utf-8
set fileencoding=utf-8

" Built in Search Improvments
set hlsearch 	" set nohlsearch " hightlight results
set incsearch 	" incremental search - show results while typing
set smartcase   " switch to case-sensitive search when uppercase letter is in your search term

" Syntax
syntax on
filetype plugin indent on " use the file type to determine the correct identation per lang
set showmatch 	" highlight matched parens, brackets, beginning and end of code blocks
set mouse=a 		" mouse support in 'a'll modes

" Clipboard yank to clipboard (or use "+y)
set clipboard+=unnamedplus

" Tabs vs Spaces
" set noexpandtab
" set tabstop=2
" set shiftwidth=2

" Performance
" set lazyredraw  " Don’t update screen during macro and script execution.

" Searching
set path+=** 	" find files in ur home path
" Tweaks for browsing:
let g:netrw_banner=0 		" disable annoying banner.
let g:netrw_browse_split=4	" open in prior windows.
let g:netrw_altv=1		" open splits to right.
let g:netrw_liststyle=3		" tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s)\zs\.\S\+'
set nowrap " hide eol when doesn't fit


" Interface Options
set number relativenumber " Set Relative line Numbers

" Move arround splits
map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>

" Disable Arrow keys in all modes, use hjkl
" Disable Arrow keys in Normal mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Disable Arrow keys in Insert mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Make greek letters usable in all modes,
" except Insert mode
map α a
map β b
map γ c
map δ d
map ε e
map ζ z
map η h
map θ u
map ι i
map κ k
map λ l
map μ m
map ν n
map ξ j
map ο o
map π p
map ρ r
map σ s
map τ t
map υ y
map χ x
map φ f
map ψ c
map ω v

" Compile R markdown
autocmd Filetype rmd map <F5> :!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>R<space>--vanilla<enter>

" Remove Statusbar
set laststatus=0 ruler
