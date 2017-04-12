UTSuite [ScalaPackage] Insert Package In Scala Files

source autoload/**

function! s:TestItConvertsAbsolutePathToCodePath()
  let s:before = "/Users/craig/Development/myproj/src/main/scala/com/example/myproj/HelloWorld"
  let s:after = AbsolutePathToCodePath(s:before)
  let s:expected = "com/example/myproj/HelloWorld"

  AssertEquals(s:after, s:expected)
endfunction

function! s:TestItConvertsSlashesToDots()
    let s:before = "com/creditkarma/testing/HelloWorld"
    let s:after = SlashToDot(s:before)
    let s:expected = "com.creditkarma.testing.HelloWorld"

    AssertEquals(s:after, s:expected)
endfunction

function! s:TestItRemovesLastWord()
    let s:before = "com.creditkarma.testing.HelloWorld"
    let s:after = RemoveLastWord(s:before)
    let s:expected = "com.creditkarma.testing"

    AssertEquals(s:after, s:expected)
endfunction

function! s:TestItInsertsThePackageKeyword()
    let s:before = "com.creditkarma.testing"
    let s:after = InsertPackageKeyword(s:before)
    let s:expected = "package com.creditkarma.testing"

    AssertEquals(s:after, s:expected)
endfunction

function! s:TestItConvertsCodePathToFlatPackage()
  let g:scala_package_flat_package = 1
  let s:before = "/Users/craig/Development/myproj/src/main/scala/com/example/myproj/hello/world/HelloWorld"
  let s:after = InsertPackageStatement(s:before, g:scala_package_flat_package)
  let s:expected = "package com.example.myproj.hello.world"

  AssertEquals(s:after, s:expected)
endfunction

function! s:TestItConvertsCodePathToMultiplePackageStatements()
  let g:scala_package_flat_package = 0
  let s:before = "/Users/craig/Development/myproj/src/main/scala/com/example/myproj/hello/world/HelloWorld"
  let s:after = InsertPackageStatement(s:before, g:scala_package_flat_package)
  let s:expected = "package com.example\npackage myproj\npackage hello\npackage world"

  AssertEquals(s:after, s:expected)
endfunction

function! s:TestItWorksWithTestFile()
  let g:scala_package_flat_package = 1
  let s:before = "/Users/craig/Development/myproj/src/test/scala/com/example/myproj/HelloWorldSpec"
  let s:after = InsertPackageStatement(s:before, g:scala_package_flat_package)
  let s:expected = "package com.example.myproj"

  AssertEquals(s:after, s:expected)
endfunction

function! s:TestItAllowsForMultiplePackageDefinitions()
  let s:before = "package com.example.myproj.hello.world"
  let s:after = FlatPackageToMultiplePackage(s:before)
  let s:expected = "package com.example\npackage myproj\npackage hello\npackage world"

  AssertEquals(s:after, s:expected)
endfunction