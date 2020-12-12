"" Emmet
" only in insert mode
let g:user_emmet_mode='i'
" just in html & css
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
" tab instead of this <C-Y>, crap
imap <expr> <C-z> emmet#expandAbbrIntelligent("\<tab>")
