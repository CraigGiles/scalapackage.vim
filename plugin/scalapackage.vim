
" ============================================================================
" Plugin:      Scala Package Insert
" Description: plugin for scala programming language that inserts package
"              statements at the top of your scala file
" Maintainer:  Craig Giles <craig@gilesc.com>
" License:     MIT
" Notes:       Bugs and contribution instructions can be found in
"              :help scalapackag
" ============================================================================"

"{{{ Init
if exists('g:loaded_scala_packages') || &cp || v:version < 700
  finish
endif
let g:loaded_scala_packages = 1
"}}}
"{{{ Configuration
if !exists('g:scala_package_prefix ')
    let g:scala_package_prefix = [ "main", "test", "it", "bt", "fun" ]
endif

if !exists('g:scala_package_flat_package')"
    let g:scala_package_flat_package = 1
endif
"}}}

command! ScalaInsertPackage call scalapackage#InsertPackageCmd()

" vim:set sw=2 sts=2 foldmethod=marker:
