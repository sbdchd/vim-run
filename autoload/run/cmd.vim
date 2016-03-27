function! g:run#cmd#GenCmd(...) abort
    let s:fullfilepath = fnameescape(expand('%:p'))
    "arg cmd
    let l:args = join(a:000)
    if l:args !=# ''
        return l:args . ' ' . s:fullfilepath
    endif
    "shebang cmd
    let l:firstline = getline(1)
    if l:firstline =~? '#!.*'
        let l:shecmd = [l:firstline[2:], s:fullfilepath]
        return join(l:shecmd)
    endif
    "user config cmd
    let l:usrcfg = 'g:run_cmd_' . &filetype
    if exists(l:usrcfg)
        let l:cmd = eval(l:usrcfg)
        return join(l:cmd)
    endif
    "filetype cmd
    let l:ftcmd = 'g:run#cmd#defaults#' . &filetype
    if exists(l:ftcmd)
        let l:cmd = eval(l:ftcmd)
        return join(l:cmd)
    else
        echom 'vim-run: command for filetype not found'
        return ''
    endif
endfunction
