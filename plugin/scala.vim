
" ============================================================================
" Plugin:      scala.vim
" Description: plugin for scala programming language that contains useful
"              scala tools for programming in the scala language
" Maintainer:  Craig Giles <craig@gilesc.com>
" License:     MIT
" Notes:       Bugs and contribution instructions can be found in
"              :help scala.vim
" ============================================================================"

"{{{ Init
if exists('g:loaded_scala_vim') || &cp || v:version < 700
  finish
endif
let g:loaded_scala_vim = 1
"}}}
"{{{ Configuration
if !exists('g:scala_package_prefix ')
    let g:scala_package_prefix = [ "main", "test", "it", "bt", "fun" ]
endif

if !exists('g:scala_package_flat')"
    let g:scala_package_flat = 1
endif
"}}}

command! ScalaInsertPackage call scala#package#InsertPackageCmd()

" vim:set sw=2 sts=2 foldmethod=marker:
