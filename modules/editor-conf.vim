" if found custom vimrc in project dir use it
set exrc
" ---- Make the editor usable in 2020 ----
set nocompatible
" Encoding
set encoding=utf-8
set fileencoding=utf-8

" Built in Search Improvments
set hlsearch 	" set nohlsearch :noh " hightlight results
set incsearch 	" incremental search - show results while typing
" set smartcase   " switch to case-sensitive search when uppercase letter is in your search term

" File Searching
set path+=** 	" find files in ur home path
" Tweaks for browsing:
let g:netrw_banner=0 		" disable annoying banner.
let g:netrw_browse_split=4	" open in prior windows.
let g:netrw_altv=1		" open splits to right.
let g:netrw_liststyle=3		" tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s)\zs\.\S\+'

" Syntax
syntax on
filetype plugin indent on " use the file type to determine the correct identation per lang
set showmatch 	" highlight matched parens, brackets, beginning and end of code blocks
set mouse=a 	" mouse support in 'a'll modes

" Clipboard yank to clipboard (or use "+y)
set clipboard+=unnamedplus

" Long lines
set nowrap " hide eol when doesn't fit

" Tabs vs Spaces
" set noexpandtab
" set tabstop=2
" set shiftwidth=2

" Performance
" set lazyredraw  " Don’t update screen during macro and script execution.
set hidden " cant explain it :h hidden :)

" Interface Options
set number relativenumber " Set Relative line Numbers

" Scrolling
set scrolloff=8

"" Splits
" Move arround splits
map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>
" Resize Splits
map <leader>+ :vertical res +5<CR>
map <leader>- :res -5<CR>
map <leader>= :res +5<CR>
map <leader>_ :vertical res -5<CR>

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

" Home key goes on first word
nmap <Home> 0w

" Make greek letters usable in all modes,
" except Insert mode
map α a
map Α A
map β b
map Β B
map γ g
map Γ G
map δ d
map Δ D
map ε e
map Ε E
map ζ z
map Ζ Z
map η h
map Η H
map θ u
map Θ U
map ι i
map Ι I
map κ k
map Κ K
map λ l
map Λ L
map μ m
map Μ M
map ν n
map Ν N
map ξ j
map Ξ J
map ο o
map Ο Ο
map π p
map Π P
map ρ r
map Ρ R
map σ s
map Σ S
map ς w
map τ t
map Τ T
map υ y
map Υ Y
map φ f
map Φ F
map χ x
map Χ X
map ψ c
map Ψ C
map ω v
map Ω V
" map ; q
" map : ρ
" map ´ ;
" map ¨ :

" Compile R markdown to pdf
autocmd Filetype rmd map <F5> :!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>R<space>--vanilla<enter>
" Compile Latex to pdf
autocmd FileType tex map <F5> :!pdflatex %<enter>
" Compile TypeScript to JavaScript
autocmd FileType ts map <F5> :!tsc %<enter>

" Autocompile & refresh dwmblocks
autocmd BufWritePost ~/.local/src/suckless/dwmblocks/blocks.h !cd ~/.local/src/suckless/dwmblocks/; sudo make install && { killall -q dwmblocks;setsid dwmblocks & }
" Autocompile dwm
autocmd BufWritePost ~/.local/src/suckless/dwm/dwm/config.h !cd ~/.local/src/suckless/dwm/dwm/; sudo make install
autocmd BufWritePost ~/.local/src/suckless/dwm/dwm/dwm.c !cd ~/.local/src/suckless/dwm/dwm/; sudo make install
" Autocompile st & refresh xrdb
autocmd BufWritePost ~/.local/src/suckless/st/config.h !cd ~/.local/src/suckless/st/; sudo make install

" Remove Statusbar
set laststatus=0 ruler

" Manage Large file >= 5mb (https://vim.fandom.com/wiki/Faster_loading_of_large_files)
" " file is large from 10mb
let g:LargeFile = 1024 * 1024 * 5
augroup LargeFile
 autocmd BufReadPre * let f=getfsize(expand("<afile>")) | if f > g:LargeFile || f == -2 | call LargeFile() | endif
augroup END

function LargeFile()
	 " no syntax highlighting etc
	 set eventignore+=FileType
	 " save memory when other file is viewed
	 setlocal bufhidden=unload
	 " is read-only (write with :w new_filename)
	 setlocal buftype=nowrite
	 " no undo possible
	 setlocal undolevels=-1
	 " no swap files
	 set noswapfile
	 " disable code completion
	 CocDisable
	 " display message
	 autocmd VimEnter *  echo "The file is larger than " . (g:LargeFile / 1024 / 1024) . " MB, so some options are changed (see .vimrc for details)."
endfunction

" Brodie center screen trick
" autocmd InsertEnter * norm zz

" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Save file as sudo on files that require root permission
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Spell-check set to <leader>o, 'o' for 'orthography':
map <leader>o :setlocal spell! spelllang=el<CR>

" True Colors
if exists('+termguicolors')
  let &t_8f = "\<ESC>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<ESC>[48;2;%lu;%lu;%lum"
endif
" Better Term Colors
let base16colorspace=256
let g:solarized_termcolors=256
set termguicolors

" Snippets
nnoremap .py2     :-1read $HOME/.config/nvim/snippets/py2skeleton<CR>ja
nnoremap .py3     :-1read $HOME/.config/nvim/snippets/py3skeleton<CR>ja
nnoremap .sh      :-1read $HOME/.config/nvim/snippets/sh<CR>ja
nnoremap .bash    :-1read $HOME/.config/nvim/snippets/bash<CR>ja
nnoremap .zsh     :-1read $HOME/.config/nvim/snippets/zsh<CR>ja
nnoremap .go      :-1read $HOME/.config/nvim/snippets/goskeleton<CR>4j3l
nnoremap .printf  :-1read $HOME/.config/nvim/snippets/Printf<CR>
nnoremap .!       :-1read $HOME/.config/nvim/snippets/html/htmlskeleton<CR>6j8wla
nnoremap .hlink   :-1read $HOME/.config/nvim/snippets/html/link<CR>
nnoremap .hstyle  :-1read $HOME/.config/nvim/snippets/html/style<CR>
nnoremap .tex     :-1read $HOME/.config/nvim/snippets/latex/latex<CR>5j6la
nnoremap .greek   :-1read $HOME/.config/nvim/snippets/latex/greek<CR>
nnoremap .eng     :-1read $HOME/.config/nvim/snippets/latex/eng<CR>

" Replace all is aliased to S.
nnoremap S :%s//g<Left><Left>

" Automatically deletes all trailing whitespace on save.
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritepre * %s/\n\+\%$//e

" Add newline and tab after { }
inoremap <expr> <CR> InsertMapForEnter()
function! InsertMapForEnter()
	if pumvisible()
		return "\<C-y>"
	elseif strcharpart(getline('.'),getpos('.')[2]-1,1) == '}'
		return "\<CR>\<Esc>O"
	elseif strcharpart(getline('.'),getpos('.')[2]-1,2) == '</'
		return "\<CR>\<Esc>O"
	elseif strcharpart(getline('.'),getpos('.')[2]-1,1) == ']'
		return "\<CR>\<Esc>O"
	elseif strcharpart(getline('.'),getpos('.')[2]-1,1) == ')'
		return "\<CR>\<Esc>O"
	else
		return "\<CR>"
	endif
endfunction

" ColorColumn
highlight ColorColumn ctermbg=magenta
" set colorcolumn=81
call matchadd('ColorColumn', '\%81v', 100)

" Bury the following somewhere deep inside someones vimrc:
" highlight ColorColumn ctermbg=red ctermfg=blue
" exec 'set colorcolumn='.join(range(2,80,3), ',')

" Map Ctrl-Backspace to delete the previous word in insert mode.
" Mapping Ctrl-Backspace does not work in terminal Vim. Following is a workaround.
noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>

" Life Hack - remap : to ; and don't have to press SHIFT ever again <3
nnoremap ; :

" Highlight tabs with '>····>'
" set list
" set listchars=tab:>->,trail:_
