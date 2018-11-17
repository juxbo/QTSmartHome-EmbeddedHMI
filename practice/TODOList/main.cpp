#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "roomlist.h"
#include "roommodel.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    qmlRegisterType<roomModel>("Room", 1, 0, "RoomModel");
    qmlRegisterUncreatableType<RoomList>("Room",1,0,"RoomList", QStringLiteral("RoomList should not be created in QML"));

    RoomList roomList;

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty(QStringLiteral("roomList"), &roomList);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
