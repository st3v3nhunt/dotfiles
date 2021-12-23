let b:ale_fixers=['prettier']
let b:ale_linters=['eslint']
let b:formatters_svelte=['eslint']
let b:svelte_preprocessor_tags = [
      \ { 'name': 'ts', 'tag': 'script', 'as': 'typescript' }
      \ ]
let b:svelte_preprocessors = ['ts']
