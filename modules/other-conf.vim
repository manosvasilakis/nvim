"" FZF
map <M-z> :FZF<CR>

"" Colorizer
lua require'colorizer'.setup()

"" Goyo
" map <leader>g :Goyo \| set bg=light \| set linebreak<CR>
map <leader>g :Goyo \| set linebreak<CR>

"" vim-move
let g:move_key_modifier = 'C'

"" VimWiki
map <leader>v :VimwikiIndex
" let g:vimwiki_list = [{'path': '~/.local/share/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_list = [{'path': '~/.local/share/vimwiki/'}]
