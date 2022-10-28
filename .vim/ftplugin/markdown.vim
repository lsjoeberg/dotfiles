" Indent with 2 spaces in Markdown files.
setlocal shiftwidth=2
setlocal tabstop=2
setlocal softtabstop=2

" Show trailing whitespace.
set listchars=trail:·

" Lint with markdownlint.
let b:ale_linters = ['mdl']
