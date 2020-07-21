set foldlevel=9
let b:ale_linters=['OmniSharp']

nmap <buffer> <leader>f :OmniSharpCodeFormat<CR>
" nmap <buffer> <leader>fi :OmniSharpFixUsings<CR>
nmap <buffer> <leader>gg :OmniSharpFindUsages<CR>
nmap <buffer> <leader>gi :OmniSharpFindImplementations<CR>
nmap <buffer> <leader>gt :OmniSharpFindType<CR>
nmap <buffer> <leader>rr :OmniSharpRenameTo<space>

autocmd BufWritePost <buffer> :OmniSharpFixUsings | :OmniSharpCodeFormat
