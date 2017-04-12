function! InsertPackageStatement(str, flat_package)
    let a:a = AbsolutePathToCodePath(a:str)
    let a:b = SlashToDot(a:a)
    let a:c = RemoveLastWord(a:b)
    let a:d = InsertPackageKeyword(a:c)

    if (a:flat_package == 1)
        return a:d
    else
        return FlatPackageToMultiplePackage(a:d)
endfunction

function! AbsolutePathToCodePath(p)
  let a:scala_package_prefix = [ "main", "test", "it" ]
  let a:test = a:p

  for i in a:scala_package_prefix
    let a:test = substitute(a:test, ".*src\/" . i . "\/scala/", "", "")
  endfor

  return a:test
endfunction

function! SlashToDot(p)
    return substitute(a:p, "/", ".", "g")
endfunction

function! RemoveLastWord(p)
    let a:ary = split(a:p, '\.')
    let a:length = len(a:ary)
    let a:all_but_last = a:ary[0:a:length - 2]

    return join(a:all_but_last, '.')
endfunction

function! InsertPackageKeyword(p)
    return "package " . a:p
endfunction

function! FlatPackageToMultiplePackage(p)
    let a:removed_package = split(a:p)[1]
    let a:ary = split(a:removed_package, '\.')
    let a:firsttwo = "package " .  a:ary[0] . "." . a:ary[1]
    let a:next = [a:firsttwo] + a:ary[2:]
    let a:joined = join(a:next, "\npackage ")

    return a:joined
endfunction
