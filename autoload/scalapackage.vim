" Plugin Entry Point: ----- !! Side Effects!! {{{
function! scalapackage#InsertPackageCmd()
    let a:package = scalapackage#InsertPackageStatement(expand('%:p:r'), g:scala_package_flat_package)
    return append(0, a:package)
endfunction
" }}}
" {{{ Composing Function Helpers
function! scalapackage#InsertPackageStatement(str, flat_package)
    let a:a = scalapackage#AbsolutePathToCodePath(a:str)
    let a:b = scalapackage#SlashToDot(a:a)
    let a:c = scalapackage#RemoveLastWord(a:b)
    let a:d = scalapackage#InsertPackageKeyword(a:c)

    if (a:flat_package == 1)
        return [a:d]
    else
        return scalapackage#FlatPackageToMultiplePackage(a:d)
endfunction
" }}}
" {{{ Function Helpers


function! scalapackage#AbsolutePathToCodePath(p)
  let a:scala_package_prefix = [ "main", "test", "it" ]
  let a:test = a:p

  for i in a:scala_package_prefix
    let a:test = substitute(a:test, ".*src\/" . i . "\/scala/", "", "")
  endfor

  return a:test
endfunction

function! scalapackage#SlashToDot(p)
    return substitute(a:p, "/", ".", "g")
endfunction

function! scalapackage#RemoveLastWord(p)
    let a:ary = split(a:p, '\.')
    let a:length = len(a:ary)
    let a:all_but_last = a:ary[0:a:length - 2]

    return join(a:all_but_last, '.')
endfunction

function! scalapackage#InsertPackageKeyword(p)
    return "package " . a:p
endfunction

function! scalapackage#FlatPackageToMultiplePackage(p)
    let a:removed_package = split(a:p)[1]
    let a:ary = split(a:removed_package, '\.')
    let a:firsttwo = a:ary[0] . "." . a:ary[1]
    let a:next = [a:firsttwo] + a:ary[2:]

    let a:joined = []
    for i in a:next
        let a:joined = a:joined + ["package " . i]
    endfor

    " let a:joined = join(a:next, "\npackage ")

    return a:joined
endfunction
" }}}

" vim:set sw=2 sts=2 foldmethod=marker:
