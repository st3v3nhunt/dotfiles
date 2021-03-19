let b:ale_fixers=['eslint']
let b:ale_linters=['eslint']
let b:formatters_svelte=['prettier']
let b:svelte_preprocessor_tags = [
  \ { 'name': 'ts', 'tag': 'script', 'as': 'typescript' }
  \ ]
let b:svelte_preprocessors = ['ts']
