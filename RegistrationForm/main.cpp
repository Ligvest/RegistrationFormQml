//#include <QGuiApplication>
#include <QApplication>
#include <QQmlApplicationEngine>
#include <iostream>

#include "comboboxupdate.h"

int main(int argc, char *argv[]) {
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    // Type for transfering QStringList with names from countries.xml
    qmlRegisterType<ComboboxUpdate>("com.company.comboboxupdate", 1, 0, "ComboboxUpdate");

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(
        &engine, &QQmlApplicationEngine::objectCreated, &app,
        [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl) QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
