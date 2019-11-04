#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>
#include <QObject>
#include <QQmlContext>
#include <QWidget>
#include <QIcon>

#include "mydevice.h"
#include "algebra.h"
#include "field.h"
#include "presets.h"
#include "xofield.h"

int main(int argc, char *argv[])
{
/*#if defined(Q_OS_ANDROID)
    QGuiApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif*/
    QApplication app(argc, argv);
    app.setOrganizationName("Любомльська гімназія");
    app.setOrganizationDomain("http://gymnasia-luboml.ucoz.ua/");
    app.setApplicationName("Програма");


    QQuickStyle::setStyle("Material");
    app.setWindowIcon(QIcon("qrc:/images/icon_prog.ico"));
    Presets p;

    qmlRegisterType<MyDevice>("mydevice", 1, 0, "MyDevice");
    qmlRegisterType<Algebra>("algebra", 1, 0, "Algebra");
    qmlRegisterType<Field>("field", 1, 0, "Field");
    qmlRegisterType<Xofield>("xofield", 1, 0, "XOField");

    qmlRegisterSingletonType(QUrl(QStringLiteral("qrc:/qml/Model.qml")), "Testing", 1, 0, "Model");

    QQmlApplicationEngine engine;

    engine.rootContext()->setContextProperty("qtversion", QString(qVersion()));
    engine.rootContext()->setContextProperty("preset", &p);
    engine.rootContext()->setContextProperty("cur", p.fld);
    engine.load(QUrl(QStringLiteral("qrc:/qml/main.qml")));
    return app.exec();
}

