function! run#cmd#GenCmd(...) abort

    let l:arg = join(a:000)
    if s:argCmd(l:arg) !=# ''
        return s:argCmd(l:arg)
    endif

    if s:shebangCmd() !=# ''
        return s:shebangCmd()
    endif

    if s:userCmd(&filetype) !=# ''
        return s:userCmd(&filetype)
    endif

    if s:filetypeCmd(&filetype) !=# ''
        return s:filetypeCmd(&filetype)
    endif
endfunction


function! s:argCmd(args) abort
    if a:args !=# ''
        " check if arg is a filetype
        if s:userCmd(a:args) !=# ''
            return s:userCmd(a:args)
        endif
        if s:filetypeCmd(a:args) !=# ''
            return s:filetypeCmd(a:args)
        endif

        return a:args . ' ' . run#defaults#fullfilepath()
    endif
    return ''
endfunction


function! s:shebangCmd() abort
    let l:firstline = getline(1)
    if l:firstline =~? '#!.*'
        let l:shecmd = [l:firstline[2:], run#defaults#fullfilepath()]
        return join(l:shecmd)
    endif

    return ''
endfunction


function! s:userCmd(filetype) abort
    let l:usrcfg = 'g:run_cmd_' . a:filetype
    if exists(l:usrcfg)
        let l:cmd = eval(l:usrcfg)
        if len(l:cmd) == 1
            return join(l:cmd) . ' ' . run#defaults#fullfilepath()
        endif
        return join(l:cmd)
    endif

    return ''
endfunction


function! s:filetypeCmd(filetype) abort
    try
        let l:cmd = eval('run#defaults#' . a:filetype . '()')
    catch /^Vim\%((\a\+)\)\=:E117/
        echom 'vim-run: command for filetype not found'
        return ''
    endtry

    if len(l:cmd) == 1
        return join(l:cmd) . ' ' . run#defaults#fullfilepath()
    endif

    return join(l:cmd)
endfunction
