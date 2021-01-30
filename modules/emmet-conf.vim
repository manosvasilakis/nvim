"" Emmet
" only in insert mode
let g:user_emmet_mode='i'
let g:user_emmet_install_global = 0
let g:user_emmet_leader_key='<tab>'
autocmd FileType html,css,php,js EmmetInstall
" tab instead of this <C-Y>, crap
" imap <expr> <C-z> emmet#expandAbbrIntelligent("\<tab>")
