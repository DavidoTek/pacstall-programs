name="keepassxc"
version="2.7.3"
description="Cross-platform community-driven port of Keepass password manager"
repology=("project: keepassxc")
url="https://github.com/keepassxreboot/keepassxc/releases/download/${version}/keepassxc-${version}-src.tar.xz"
hash="3d5dd662ae1b9c48f4a796606088fb68a4f0e6f147458d477ee6fb0f4cb2a7de"
maintainer="Marie Piontek <marie@kaifa.ch>"
gives="org.freedesktop.secrets"
breaks="${name} ${name}-bin ${name}-git ${name}-deb"

depends="argon2 botan curl hicolor-icon-theme libxtst6 minizip libpcsclite1 qrencode libqt5x11extras5 libqt5svg5 libminizip1 libqrencode4 qt5-qmake qtbase5-dev qtchooser qt5-qmake qtbase5-dev-tools"
build_depends="cmake asciidoctor libqrencode-dev libbotan-2-dev libargon2-dev libpcsclite-dev libminizip-dev libusb-1.0-0-dev libreadline-dev libqt5x11extras5-dev libqt5svg5-dev zlib1g-dev libxtst-dev qtbase5-private-dev qttools5-dev qtbase5-dev qt5-qmake qtbase5-dev-tools qtdeclarative5-dev"
optdepends=("xclip: keepassxc-cli clipboard support under X server"
            "wl-clipboard: keepassxc-cli clipboard support under Wayland")

prepare() {
    true
}

build() {
    cmake -S . -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DWITH_XC_ALL=ON \
    -DWITH_XC_UPDATECHECK=OFF
    cmake --build build
}

install() {
    sudo cmake --build build --target install -- DESTDIR="${STOWDIR}/${name}"
}
