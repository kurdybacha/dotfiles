#!/bin/bash

INSTALL_PREFIX=${HOME}/Linux
DOWNLOAD_DIR=${HOME}/Repo/opensource

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
    if [ $# -eq 1 ]; then
        repo=$(basename -- $1)
        repo_name="${repo##*.}" # remove .git if exists
        dst_dir=${DOWNLOAD_DIR}/${repo_name}/
    else
        dst_dir=$2/
    fi
    if [ -d ${dst_dir} ]; then
        git -C ${dst_dir} pull
        git -C ${dst_dir} submodule update --recursive
    else
        git clone --recurse-submodule -j5 https://github.com/$1 ${dst_dir}
    fi
}

rtags_install() {
    pushd .
    git_clone "Andersbakken/rtags"
    cd ${DOWNLOAD_DIR}/rtags
    cmake_build -DBUILD_TESTING=OFF
    popd
}

youcompleteme_install() {
    pushd .
    git_clone "Valloric/YouCompleteMe" "${HOME}/.vim/plugged/YouCompleteMe"
    cd "${HOME}/.vim/plugged/YouCompleteMe"
    ./install.py --clang-completer
    popd
}

powerline_fonts_install() {
    pushd .
    git_clone "powerline/fonts"
    cd ${DOWNLOAD_DIR}/fonts
    ./install.sh
    popd
}

cquery_install() {
    pushd .
    git_clone "cquery-project/cquery"
    cd ${DOWNLOAD_DIR}/cquery
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

