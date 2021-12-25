" Search for prettier file recursively upwards
if filereadable(findfile('.prettierrc', '.;'))
  echom "Using prettier for linting and fixing"
  let b:ale_fixers=['prettier']
  let b:ale_linters=['prettier']
  let b:formatters_javascript=['prettier']
else
  echom "Using standard for linting and fixing"
  let b:ale_fixers=['standard']
  let b:ale_linters=['standard']
  let b:formatters_javascript=['standard_javascript']
endif
