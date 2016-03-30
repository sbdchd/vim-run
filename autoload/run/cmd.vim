function! run#cmd#GenCmd(...) abort
    let l:fullfilepath = fnameescape(expand('%:p'))

    " arg cmd
    let l:args = join(a:000)
    if l:args !=# ''
        return l:args . ' ' . l:fullfilepath
    endif

    " shebang cmd
    let l:firstline = getline(1)
    if l:firstline =~? '#!.*'
        let l:shecmd = [l:firstline[2:], l:fullfilepath]
        return join(l:shecmd)
    endif

    " user config cmd
    let l:usrcfg = 'g:run_cmd_' . &filetype
    if exists(l:usrcfg)
        let l:cmd = eval(l:usrcfg)
        if len(l:cmd) == 1
            return join(l:cmd) . ' ' . l:fullfilepath
        endif
        return join(l:cmd)
    endif

    " filetype cmd
    try
        let l:cmd = eval('run#defaults#' . &filetype . '()')
    catch /^Vim\%((\a\+)\)\=:E117/
        echom 'vim-run: command for filetype not found'
        return ''
    endtry

    if len(l:cmd) == 1
        return join(l:cmd) . ' ' . l:fullfilepath
    endif

    return join(l:cmd)
endfunction
