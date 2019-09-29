QT += quick location network positioning
CONFIG += c++11

# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Refer to the documentation for the
# deprecated API to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        locator.cpp \
        main.cpp

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android-sources

contains(ANDROID_TARGET_ARCH,armeabi-v7a) {
    ANDROID_EXTRA_LIBS = \
    $$PWD/lib/libcrypto.so \
    $$PWD/lib/libssl.so
}

contains(ANDROID_TARGET_ARCH,x86_64) {
    ANDROID_EXTRA_LIBS = \
        $$PWD/../build-openssl/libcrypto.so \
        $$PWD/../build-openssl/libssl.so
}

contains(ANDROID_TARGET_ARCH,arm64-v8a) {
    ANDROID_EXTRA_LIBS = \
    /home/yordan/Projects/mapme/../build-openssl/libssl.so \
    $$PWD/../build-openssl/libcrypto.so
}

SUBDIRS += \
    openssl-1.1.1/util/indent.pro

RESOURCES += \
    qml.qrc

DISTFILES += \
    android-sources/AndroidManifest.xml

HEADERS += \
    locator.h
