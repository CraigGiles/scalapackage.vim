# *scalapackage.txt*
#### Plugin for inserting package statements in Scala files

#### INTRODUCTION
---

This plugin was developed as a learning experience but filled a need for my
workflow. The code can be found on its github repository

#### INSTALLATION
---

If you have Vundle, Pathogen, or VimPlug installed, simply add the following to your .vimrc:

Vundle:

    Plugin 'CraigGiles/scalapackage.vim'
    :PluginInstall

Pathogen:

    cd ~/.vim/bundle && \
    git clone https://github.com/CraigGiles/scalapackage.vim.git

VimPlug

    Plug 'CraigGiles/scalapackage.vim'
    :PluginInstall

#### USAGE
---

Usage of this plugin is straightforward. When editing a *.scala file you can
issue a *:ScalaInsertPackage* command to append the package to the top of the
current buffer.

#### MAPPINGS
---

There are no mappings associated with this plugin. To create a mapping simply
issue a new mapping to :ScalaInsertPackage<CR>

#### CONFIGURATION
---

There are two configuration options for `scalapackage`.

    let g:scala_package_prefix = [ "main", "test", "it", "bt", "fun" ]

`g:scala_package_prefix` is a list of directories which can contain scala files
within the `src/<PREFIX>/scala` folder structure. Typical maven structures
will have a `src/main/scala` and `src/test/scala` but adding your own scopes
for testing (`it` is a typical one) should work with this plugin as well as
long as they're included in the `g:scala_package_prefix` list.

    let g:scala_package_flat_package = 1

`g:scala_package_flat_package` allows a user to insert a single package
statement at the top of their buffer. Single package statements will look
like typical java / scala package statements:

    package com.company.project.whatever

When `g:scala_package_flat_package` is set to 0 it will issue multiple
package statements:

    package com.company
    package project
    package whatever

#### LICENSE
---

This software is written and distributed with the MIT license.

#### BUGS
---

Known issue with package objects not having the right package statement

#### CONTRIBUTING
---

Bugs can be reported and the very latest development version can be retrieved
from GitHub. If you would like to contribute back, simply fork the project and
submit a pull request into the `master` branch

#### CHANGELOG
---

    * `1.0.0` Initial version

#### CREDITS
---

This plugin is written and maintained by Craig Giles <http://www.gilesc.com>
Learning resources for writing this plugin can be attributed to many sources:

##### Learning Resources:

  * Damian Conwey - Scripting the VIM editor:
       https://www.ibm.com/developerworks/library/l-vim-script-1/
  * Steve Losh - Learn Vimscript the hard way:
       http://learnvimscriptthehardway.stevelosh.com
  * Rico Sta. Cruz - Vimscript Functions Cheatsheet:
      http://ricostacruz.com/cheatsheets/vimscript-functions.html

Inspiration from:
  * Damian Conway
  * Tim Pope

