" ColorColumn
highlight ColorColumn ctermbg=magenta
" set colorcolumn=81
call matchadd('ColorColumn', '\%81v', 100)

" Bury the following somewhere deep inside someones vimrc:
" highlight ColorColumn ctermbg=red ctermfg=blue
" exec 'set colorcolumn='.join(range(2,80,3), ',')

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
nnoremap .py2     :-1read $HOME/.config/nvim/skeletons/py2skeleton<CR>ja
nnoremap .py3     :-1read $HOME/.config/nvim/skeletons/py3skeleton<CR>ja
nnoremap .sh      :-1read $HOME/.config/nvim/skeletons/sh<CR>ja
nnoremap .bash    :-1read $HOME/.config/nvim/skeletons/bash<CR>ja
nnoremap .zsh     :-1read $HOME/.config/nvim/skeletons/zsh<CR>ja
nnoremap .go      :-1read $HOME/.config/nvim/skeletons/goskeleton<CR>4j3l
nnoremap .printf  :-1read $HOME/.config/nvim/skeletons/Printf<CR>
nnoremap .html    :-1read $HOME/.config/nvim/skeletons/html/htmlskeleton<CR>12jwf>a
nnoremap .hlink   :-1read $HOME/.config/nvim/skeletons/html/link<CR>
nnoremap .hstyle  :-1read $HOME/.config/nvim/skeletons/html/style<CR>

" Map Ctrl-Backspace to delete the previous word in insert mode.
" Mapping Ctrl-Backspace does not work in terminal Vim. Following is a workaround.
noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>

" Life Hack - remap : to ; and don't have to press SHIFT ever again <3
nnoremap ; :

" Replace all is aliased to S.
nnoremap S :%s//g<Left><Left>

" Automatically deletes all trailing whitespace on save.
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritepre * %s/\n\+\%$//e

" Disables automatic commenting on newline:
" autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Highlight tabs with '>····>'
" set list
" set listchars=tab:>->,trail:_

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
 " display message
 autocmd VimEnter *  echo "The file is larger than " . (g:LargeFile / 1024 / 1024) . " MB, so some options are changed (see .vimrc for details)."
endfunction
