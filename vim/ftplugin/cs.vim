set foldlevel=9
set shiftwidth=4                                                               " number of spaces for each step of (auto)indent
let b:OmniSharp_diagnostic_overries = {
      \ 'IDE0160': { 'type': 'None' }
      \}

nmap <buffer> <leader>fu :OmniSharpFixUsings<CR>
nmap <buffer> <leader>rs :OmniSharpRestartAllServers<CR>

autocmd BufWritePost <buffer> :OmniSharpCodeFormat
