QT       += core gui concurrent network

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = Caesium
TEMPLATE = app

QMAKE_MAC_SDK = macosx10.11

macx {
    QMAKE_CXXFLAGS_CXX11 = -std=gnu++1y
    CONFIG *= c++11
    QMAKE_CXXFLAGS += -stdlib=libc++
    LIBS +=  -L/opt/mozjpeg/lib -L/usr/local/lib -ljpeg.62 -lturbojpeg -lzopflipng -lexiv2.14
    INCLUDEPATH += /opt/mozjpeg/include /usr/local/include
    ICON = icons/icons/icon.icns
}

win32 {
    LIBS += -LC:\\mozjpeg\\lib -LC:\\zopfli -ljpeg -LC:\\exiv2\\src\\.libs -lexiv2 -lturbojpeg -lzopflipng
    INCLUDEPATH += C:\\mozjpeg\\include C:\\exiv2\\include C:\\zopfli\\src
    RC_ICONS = icons/main/icon.ico
}

unix {
    LIBS += -ljpeg -lexiv2 -lturbojpeg -lzopflipng
}

CONFIG += warn_off c++11

SOURCES += src/main.cpp\
    src/aboutdialog.cpp \
    src/utils.cpp \
    src/exif.cpp \
    src/preferencedialog.cpp \
    src/networkoperations.cpp \
    src/qdroptreewidget.cpp \
    src/caesium.cpp \
    src/clist.cpp \
    src/jpeg.cpp \
    src/png.cpp \
    src/lodepng.cpp \
    src/cimage.cpp \
    src/ctreewidgetitem.cpp

HEADERS  += \
    src/aboutdialog.h \
    src/utils.h \
    src/exif.h \
    src/preferencedialog.h \
    src/networkoperations.h \
    src/qdroptreewidget.h \
    src/ctreewidgetitem.h \
    src/caesium.h \
    src/clist.h \
    src/jpeg.h \
    src/lodepng.h \
    src/png.h \
    src/cimage.h

FORMS    += \
    src/aboutdialog.ui \
    src/preferencedialog.ui \
    src/caesium.ui

RESOURCES += \
    icons.qrc \
    style.qrc

DISTFILES += \
    qss/style_osx.qss \
    qss/style_win.qss \
    qss/style_linux.qss

TRANSLATIONS = translations/caesium_en_US.ts \
    translations/caesium_it_IT.ts
