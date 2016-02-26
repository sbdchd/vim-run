"/Users/sloth/documents/example.vim
let s:fullfilepath = fnameescape(expand('%:p'))
" example
let s:basefilename = shellescape(expand('%:r'))
" example.vim
let s:fullfilename = shellescape(expand('%'))

" default cmds
let g:run#cmd#defaults#applescript = [
            \ 'osascript',
            \ s:fullfilepath
            \ ]
let g:run#cmd#defaults#bash = [
            \ 'bash',
            \ s:fullfilepath
            \ ]
let g:run#cmd#defaults#erlang = [
            \ 'escript',
            \ s:fullfilepath
            \ ]
let g:run#cmd#defaults#go = [
            \ 'go run',
            \ s:fullfilepath
            \ ]
let g:run#cmd#defaults#java = [
            \ 'javac',
            \ '-g:none',
            \ s:fullfilepath,
            \ '&&',
            \ 'java',
            \ s:basefilename
            \ ]
let g:run#cmd#defaults#js = [
            \ 'node',
            \ s:fullfilepath
            \ ]
let g:run#cmd#defaults#lua = [
            \ 'lua',
            \ s:fullfilepath
            \ ]
let g:run#cmd#defaults#perl = [
            \ 'perl',
            \ s:fullfilepath
            \ ]
let g:run#cmd#defaults#php = [
            \ 'php',
            \ s:fullfilepath
            \ ]
let g:run#cmd#defaults#python = [
            \ 'python',
            \ s:fullfilepath
            \ ]

let g:run#cmd#defaults#ruby = [
            \ 'ruby',
            \ s:fullfilepath
            \ ]
let g:run#cmd#defaults#sh = [
            \ 'sh',
            \ s:fullfilepath
            \ ]
