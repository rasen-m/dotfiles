setlocal foldmethod=expr
setlocal foldexpr=GetFold(v:lnum)

function! MyGetFold(lnum)
    " I only want my files to fold at function level
    if getline(a:lnum) =~? '\v^\s*$'
        return '-1'
    endif

    if IndentLevel(a:lnum) >= 1
        return '1'
    else
        return '0'
    endif
endfunction

function! GetFold(lnum)
    if getline(a:lnum) =~? '\v^\s*$'
        return '-1'
    endif

    let this_indent = IndentLevel(a:lnum)
    let next_indent = IndentLevel(NextNonBlankLine(a:lnum))

    if next_indent == this_indent
        return this_indent
    elseif next_indent < this_indent
        return this_indent
    elseif next_indent > this_indent
        return '>' . next_indent
    endif
endfunction

function! NextNonBlankLine(lnum)
    let numlines = line('$')
    let current = a:lnum +1

    while current <= numlines
        if getline(current) =~? '\v\S'
            return current
        endif

        let current += 1
    endwhile

    return -2
endfunction

function! IndentLevel(lnum)
    return indent(a:lnum) / &shiftwidth
endfunction
