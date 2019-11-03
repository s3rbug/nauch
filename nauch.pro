TEMPLATE = app

QT += qml quick widgets
QT += quickcontrols2
QT_QUICK_CONTROLS_STYLE = material
win32:RC_ICONS += icon2.ico

android: {
QT += androidextras
}

SOURCES += sources/main.cpp \
    sources/mydevice.cpp \
    sources/algebra.cpp \
    sources/field.cpp \
    sources/presets.cpp \
    sources/saves.cpp \
    sources/xofield.cpp

HEADERS += sources/mydevice.h \
    sources/algebra.h \
    sources/field.h \
    sources/presets.h \
    sources/saves.h \
    sources/xofield.h

RESOURCES += qml.qrc \
    images.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

