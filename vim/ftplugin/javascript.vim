" Search for prettier file recursively upwards
if filereadable(findfile('.prettierrc', '.;'))
  let b:ale_fixers=['prettier']
  let b:ale_linters=['prettier']
else
  let b:ale_fixers=['standard']
  let b:ale_linters=['standard']
  let b:formatters_javascript=['standard_javascript']
endif
