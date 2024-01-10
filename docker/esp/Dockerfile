FROM archlinux:latest as base-dev

ARG USER=pawel
ARG UID=1000
ARG GID=1000

RUN groupadd -g $GID -o $USER && \
    useradd -m -u $UID -g $GID -o -s /bin/bash $USER

RUN pacman-key --init && \
    pacman-key --populate

RUN pacman -Suy --noconfirm && pacman --noconfirm -S \
    base-devel \
    fzf \
    git \
    make \
    man-db \
    nodejs \
    npm \
    openssh \
    python \
    ranger \
    ripgrep \
    sudo \
    tldr \
    tmux \
    unzip \
    vim \
    wget \
    python-black \
    python-pip
RUN echo "$USER ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
USER $USER

######### ESP ##############

FROM base-dev as esp-dev
ARG USER=pawel

RUN sudo pacman -Suy --needed --noconfirm && sudo pacman --noconfirm -S \
    gperf \
    cmake \
    ninja \
    ccache \
    dfu-util

ARG IDF_CLONE_URL=https://github.com/espressif/esp-idf.git
ARG IDF_CLONE_BRANCH_OR_TAG=master
ARG IDF_CHECKOUT_REF=
ARG IDF_CLONE_SHALLOW=
ARG IDF_CLONE_SHALLOW_DEPTH=1
ARG IDF_INSTALL_TARGETS=all

ENV IDF_TOOLS_PATH=/opt/esp
ENV IDF_PATH=/opt/esp/idf

RUN sudo mkdir -p $IDF_TOOLS_PATH && \
    sudo chown -R $USER $IDF_TOOLS_PATH

RUN echo IDF_CHECKOUT_REF=$IDF_CHECKOUT_REF IDF_CLONE_BRANCH_OR_TAG=$IDF_CLONE_BRANCH_OR_TAG && \
    git clone --recursive \
      ${IDF_CLONE_SHALLOW:+--depth=${IDF_CLONE_SHALLOW_DEPTH} --shallow-submodules} \
      ${IDF_CLONE_BRANCH_OR_TAG:+-b $IDF_CLONE_BRANCH_OR_TAG} \
      $IDF_CLONE_URL $IDF_PATH && \
    if [ -n "$IDF_CHECKOUT_REF" ]; then \
      cd $IDF_PATH && \
      if [ -n "$IDF_CLONE_SHALLOW" ]; then \
        git fetch origin --depth=${IDF_CLONE_SHALLOW_DEPTH} --recurse-submodules ${IDF_CHECKOUT_REF}; \
      fi && \
      git checkout $IDF_CHECKOUT_REF && \
      git submodule update --init --recursive; \
    fi

# Install all the required tools
RUN : \
  && $IDF_PATH/install.sh all \
  && rm -rf $IDF_TOOLS_PATH/dist \
  && :

USER $USER
# Access to /dev/ttyUSB0 which is our ESP board device
RUN sudo usermod -aG uucp $USER
ENV IDF_PYTHON_CHECK_CONSTRAINTS=no
ENV IDF_CCACHE_ENABLE=1
COPY entrypoint.sh /opt/esp/entrypoint.sh
ENTRYPOINT [ "/opt/esp/entrypoint.sh" ]
CMD [ "/bin/bash" ]

############################
