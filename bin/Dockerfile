FROM archlinux:latest as base-dev

ARG USER=pawel
ARG UID=1000
ARG GID=1000

RUN groupadd -g $GID -o $USER && \
    useradd -m -u $UID -g $GID -o -s /bin/bash $USER
RUN pacman -Suy --noconfirm && pacman --noconfirm -S \
    base-devel \
    fzf \
    git \
    make \
    man-db \
    openssh \
    python \
    ranger \
    ripgrep \
    sudo \
    tldr \
    tmux \
    unzip \
    vim \
    wget
RUN echo "$USER ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
USER $USER

FROM base-dev as flutter-dev
ARG USER=pawel
ENV WORKSPACE="/workspace"
ENV JAVA_VERSION="8"
ENV ANDROID_TOOLS_URL="https://dl.google.com/android/repository/commandlinetools-linux-8092744_latest.zip"
ENV ANDROID_VERSION="31"
ENV ANDROID_BUILD_TOOLS_VERSION="29.0.3"
ENV ANDROID_ARCHITECTURE="x86_64"
ENV ANDROID_SDK_ROOT="/opt/android-sdk"
ENV ANDROID_PREFS_ROOT="$WORKSPACE"
ENV FLUTTER_VERSION="2.10.1"
ENV FLUTTER_URL="https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_$FLUTTER_VERSION-stable.tar.xz"
ENV FLUTTER_HOME="/opt/flutter"
ENV PATH="$ANDROID_SDK_ROOT/cmdline-tools/tools/bin:$ANDROID_SDK_ROOT/platform-tools:$ANDROID_SDK_ROOT/platforms:$FLUTTER_HOME/bin/cache/dart-sdk/bin:$FLUTTER_HOME/bin:$PATH"

RUN sudo pacman -Suy --noconfirm &&  sudo pacman --noconfirm -S \
    jdk8-openjdk

USER $USER
WORKDIR $WORKSPACE

# android sdk
RUN sudo chown -R $USER $WORKSPACE && \
    sudo mkdir -p $ANDROID_SDK_ROOT && sudo chown -R $USER $ANDROID_SDK_ROOT && \
    mkdir -p $ANDROID_PREFS_ROOT/.android && \
    touch $ANDROID_PREFS_ROOT/.android/repositories.cfg && \
    curl -o /tmp/android_tools.zip $ANDROID_TOOLS_URL && \
    unzip -qq -d "$ANDROID_SDK_ROOT" /tmp/android_tools.zip && \
    rm /tmp/android_tools.zip && \
    mkdir -p $ANDROID_SDK_ROOT/cmdline-tools/tools && \
    mv $ANDROID_SDK_ROOT/cmdline-tools/bin $ANDROID_SDK_ROOT/cmdline-tools/tools && \
    mv $ANDROID_SDK_ROOT/cmdline-tools/lib $ANDROID_SDK_ROOT/cmdline-tools/tools && \
    yes "y" | sdkmanager "build-tools;$ANDROID_BUILD_TOOLS_VERSION" && \
    yes "y" | sdkmanager "platforms;android-$ANDROID_VERSION" && \
    yes "y" | sdkmanager "platform-tools" && \
    yes "y" | sdkmanager "cmdline-tools;latest"
    #&& yes "y" | sdkmanager "emulator" \
    #&& yes "y" | sdkmanager "system-images;android-$ANDROID_VERSION;google_apis_playstore;$ANDROID_ARCHITECTURE" \

# flutter
RUN curl -o /tmp/flutter.tar.xz $FLUTTER_URL && \
    sudo mkdir -p $FLUTTER_HOME && sudo chown -R $USER $FLUTTER_HOME && \
    tar xf /tmp/flutter.tar.xz --strip-components 1 -C $FLUTTER_HOME && \
    rm /tmp/flutter.tar.xz && \
    flutter config --no-analytics && \
    flutter precache && \
    yes "y" | flutter doctor --android-licenses && \
    flutter doctor
