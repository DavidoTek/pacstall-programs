name="tidal-hifi-bin"
pkgname="tidal-hifi"
version="4.3.1"
description="The web version of listen.tidal.com running in electron with hifi support thanks to widevine"
repology=("project: tidal-hifi" "visiblename: tidal-hifi-bin")
url="https://github.com/Mastermindzh/tidal-hifi/releases/download/${version}/tidal-hifi-${version}.tar.gz"
hash="f408a9b8fd60ac56e2863573fa895c36d9900ef5dc46005714311e26b5b0c743"
maintainer="Marie Piontek <marie@kaifa.ch>"
gives="${pkgname}"
breaks="${pkgname} ${pkgname}-deb ${pkgname}-app ${pkgname}-git"

depends="libxss1 libnss3 libgtk-3-0"

prepare() {
    true
}

build() {
    true
}

install() {
    # Get icon from github and install it
    wget -q "https://github.com/Mastermindzh/tidal-hifi/raw/master/build/icon.png"
    sudo install -Dm644 icon.png "${STOWDIR}/${name}/usr/share/pixmaps/${pkgname}.png"

    # Get desktop file and install it
    wget -q "https://aur.archlinux.org/cgit/aur.git/plain/tidal-hifi.desktop?h=tidal-hifi-bin" -O tidal-hifi.desktop
    sudo install -Dm644 tidal-hifi.desktop -t "${STOWDIR}/${name}/usr/share/applications"

    # Install the rest of the app
    sudo install -d "${STOWDIR}/${name}/opt/${pkgname}/" "${STOWDIR}/${name}/usr/bin"

    sudo cp -r ${SRCDIR}/tidal-hifi-${version}/* ${STOWDIR}/${name}/opt/${pkgname}/
    sudo chmod +x "${STOWDIR}/${name}/opt/${pkgname}/tidal-hifi"
}

postinst() {
    sudo ln -s -r "/opt/${pkgname}/tidal-hifi" "/usr/bin/tidal-hifi"
}

removescript() {
    sudo rm -f "/usr/bin/tidal-hifi"
}
