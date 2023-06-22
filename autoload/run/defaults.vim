" Helper Functions
function! run#defaults#fullfilepath() abort
    " /Users/sloth/documents/example.vim
    return fnameescape(expand('%:p'))
endfunction

function! run#defaults#basefilename() abort
    " example
    return shellescape(expand('%:r'))
endfunction

function! run#defaults#fullfilename() abort
    " example.vim
    return shellescape(expand('%'))
endfunction


" Defaults
function! run#defaults#javascript() abort
    return ['node']
endfunction

function! run#defaults#python() abort
    return ['python']
endfunction

function! run#defaults#applescript() abort
    return ['osascript']
endfunction

function! run#defaults#erlang() abort
    return ['escript']
endfunction

function! run#defaults#go() abort
    return ['go run']
endfunction

function! run#defaults#java() abort
    return [
                \ 'javac',
                \ '-g:none',
                \ run#defaults#fullfilepath(),
                \ '&&',
                \ 'java',
                \ run#defaults#basefilename()
                \ ]
endfunction

function! run#defaults#lua() abort
    return ['lua']
endfunction

function! run#defaults#perl() abort
    return ['perl']
endfunction

function! run#defaults#php() abort
    return ['php']
endfunction

function! run#defaults#ruby() abort
    return ['ruby']
endfunction

function! run#defaults#sh() abort
    return ['sh']
endfunction

function! run#defaults#idris() abort
    return ['idris']
endfunction

function! run#defaults#ghci() abort
    return ['ghci']
endfunction

function! run#defaults#coffee() abort
    return ['coffee']
endfunction

function! run#defaults#typescript() abort
    return [
                \ 'tsc',
                \ run#defaults#fullfilepath(),
                \ '&&',
                \ 'node',
                \ run#defaults#basefilename() . '.js'
                \ ]
endfunction

function! run#defaults#elixir() abort
    return ['elixir']
endfunction

function! run#defaults#rust() abort
	return ['cargo run']
endfunction

function! run#defaults#moon() abort
    return ['moon']
endfunction
