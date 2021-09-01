set foldlevel=9
set shiftwidth=4                                                               " number of spaces for each step of (auto)indent
let b:ale_linters=['OmniSharp']

nmap <buffer> <leader>ff :OmniSharpCodeFormat<CR>
nmap <buffer> <leader>fi :OmniSharpGetCodeActions<CR>
nmap <buffer> <leader>fir :OmniSharpRepeatCodeAction<CR>
nmap <buffer> <leader>fu :OmniSharpFixUsings<CR>
nmap <buffer> <leader>gg :OmniSharpFindUsages<CR>
nmap <buffer> <leader>gi :OmniSharpFindImplementations<CR>
nmap <buffer> <leader>gt :OmniSharpFindType<CR>
nmap <buffer> <leader>rr :OmniSharpRenameTo<space>
nmap <buffer> <leader>rs :OmniSharpRestartAllServers<CR>

autocmd BufWritePost <buffer> :OmniSharpCodeFormat
