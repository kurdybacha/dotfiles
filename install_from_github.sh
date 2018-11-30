#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "utils.sh"

INSTALL_PREFIX=${HOME}/Linux

cmake_build() {
    local cmake_args="-H. -Bbuild -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=${INSTALL_PREFIX} \
        -DCMAKE_EXPORT_COMPILE_COMMANDS=YES"
    cmake_args="$cmake_args $@"
    cmake $cmake_args
    cmake --build build -- -j5 && \
    cmake --build build --target install
}

git_clone() {
    repo=$(basename -- $1)
    repo_name="${repo##*.}" # remove .git if exists
    if [ -d ${repo_name} ]; then
        git -C ${repo_name} pull
        git -C ${repo_name} submodule update --recursive
    else
        git clone --recurse-submodule -j5 https://github.com/$1
    fi
}

rtags_install() {
    pushd .
    git_clone "Andersbakken/rtags"
    cd rtags
    cmake_build -DBUILD_TESTING=OFF
    popd
}

youcompleteme_install() {
    pushd .
    if [ -d "vim/plugged/YouCompleteMe" ]; then
        git -C vim/plugged/YouCompleteMe pull
        git -C vim/plugged/YouCompleteMe submodule update --recursive
    else
        git clone --recurse-submodules https://github.com/Valloric/YouCompleteMe.git vim/plugged/YouCompleteMe
    fi
    cd vim/plugged/YouCompleteMe && \
    ./install.py --clang-completer
    popd
}

powerline_fonts_install() {
    pushd .
    git_clone "powerline/fonts"
    cd fonts && ./install.sh && cd .. && rm -rf fonts
    popd
}

cquery_install() {
    pushd .
    git_clone "cquery-project/cquery"
    cd cquery
    cmake_build
    popd
}

urxvt_extensions() {
    pushd .
    mkdir -p $HOME/.urxvt/ext
    wget -P $HOME/.urxvt/ext https://raw.githubusercontent.com/majutsushi/urxvt-font-size/master/font-size
    wget -P $HOME/.urxvt/ext https://raw.githubusercontent.com/muennich/urxvt-perls/master/keyboard-select
    popd
}

mkdir -p $INSTALL_PREFIX/bin
rtags_install
youcompleteme_install
powerline_fonts_install
urxvt_extensions
# cquery_install
