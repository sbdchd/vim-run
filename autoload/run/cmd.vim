function! g:run#cmd#GenCmd(...) abort

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
    let l:fullfilepath = fnameescape(expand('%:p'))

    if a:args !=# ''
        " check if arg is a filetype
        if s:userCmd(a:args) !=# ''
            return s:userCmd(a:args)
        endif
        if s:filetypeCmd(a:args) !=# ''
            return s:filetypeCmd(a:args)
        endif

        return a:args . ' ' . l:fullfilepath
    endif
    return ''
endfunction


function! s:shebangCmd() abort
    let l:fullfilepath = fnameescape(expand('%:p'))

    let l:firstline = getline(1)
    if l:firstline =~? '#!.*'
        let l:shecmd = [l:firstline[2:], l:fullfilepath]
        return join(l:shecmd)
    endif

    return ''
endfunction


function! s:userCmd(filetype) abort
    let l:usrcfg = 'g:run_cmd_' . a:filetype
    if exists(l:usrcfg)
        let l:cmd = eval(l:usrcfg)
        return join(l:cmd)
    endif

    return ''
endfunction


function! s:filetypeCmd(filetype) abort
    let l:ftcmd = 'g:run#cmd#defaults#' . a:filetype
    if exists(l:ftcmd)
        let l:cmd = eval(l:ftcmd)
        return join(l:cmd)
    endif

    echom 'vim-run: command for filetype not found'
    return ''
endfunction
