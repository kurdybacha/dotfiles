## 1 Requirements
* [Vim](http://www.vim.org) 7.4 or newer
* [exuberant ctags](http://ctags.sourceforge.net/)
* [clang](http://clang.llvm.org/) 3.3 or newer (to compile the [YouCompletMe](https://github.com/Valloric/YouCompleteMe) clang-completer)
* [cmake](http://www.cmake.org/)(to compile the [YouCompletMe](https://github.com/Valloric/YouCompleteMe))
* [Python](http://www.python.org) 2.7 or newer
* [Git](http://www.git-scm.com/) 1.7 or newer
* [The Silver Search](http://geoff.greer.fm/ag/)

## 2 Installation
* `$  git clone https://github.com/kladku/vim.git ~/.vim`
* `$  ln -s ~/.vim/vimrc ~/.vimrc`
* `$  cd ~/.vim`
* `$  git submodule init`
* `$  git submodule udpate`
* `$  vim +NeoBundleInstall
* `$  cd ~/.vim/bundle/YouCompleteMe ./install.sh --clang-completer
   
