#!/bin/bash

chmod +x configure

if [ `uname` == Linux ]; then
    MAKE_JOBS=$CPU_COUNT

    ./configure -prefix $PREFIX \
                -L $PREFIX/lib \
                -I $PREFIX/include \
                -release \
                -opensource \
                -confirm-license \
                -shared \
                -nomake examples \
                -nomake tests \
                -verbose \
                -no-libudev \
                -no-gtkstyle \
                -qt-xcb \
                -qt-pcre \
                -qt-xkbcommon \
                -skip qtmultimedia \
                -xkb-config-root $PREFIX/lib \
                -dbus
fi

if [ `uname` == Darwin ]; then
    # Let Qt set its own flags and vars
    for x in OSX_ARCH CFLAGS CXXFLAGS LDFLAGS
    do
        unset $x
    done

    MACOSX_DEPLOYMENT_TARGET=10.7
    MAKE_JOBS=$(sysctl -n hw.ncpu)

    ./configure -prefix $PREFIX \
                -L $PREFIX/lib \
                -I $PREFIX/include \
                -release \
                -opensource \
                -confirm-license \
                -shared \
                -nomake examples \
                -nomake tests \
                -verbose \
                -skip qtwebengine \
                -qt-pcre \
                -platform macx-g++ \
                -no-c++11 \
                -no-framework \
                -no-dbus \
                -no-mtdev \
                -no-harfbuzz \
                -no-xinput2 \
                -no-xcb-xlib \
                -no-libudev \
                -no-egl
fi

make -j $MAKE_JOBS
make install

#removes doc, phrasebooks, and translations
rm -rf $PREFIX/share/qt5

# Remove static libs
rm -rf $PREFIX/lib/*.a

# Add qt.conf file to the package to make it fully relocatable
cat <<EOF >$PREFIX/qt.conf
[Paths]
Prefix = $PREFIX
EOF

