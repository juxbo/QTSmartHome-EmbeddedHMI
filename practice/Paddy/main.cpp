#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "house.h"

int main(int argc, char *argv[])
{

    House house;

    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    qmlRegisterType<Room>("RoomClass", 1, 0, "RoomClass");

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("house", &house);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));


    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
