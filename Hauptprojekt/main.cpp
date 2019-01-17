#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QOpenGLContext>
#include <QDebug>

#include "house.h"

void setSurfaceFormat()
{
    QSurfaceFormat format;
#ifdef QT_OPENGL_ES_2
    format.setRenderableType(QSurfaceFormat::OpenGLES);
#else
    if (QOpenGLContext::openGLModuleType() == QOpenGLContext::LibGL) {
        format.setVersion(2, 0);
        format.setProfile(QSurfaceFormat::CoreProfile);
    }
#endif
    format.setDepthBufferSize(24);
    format.setSamples(4);
    format.setStencilBufferSize(8);
    QSurfaceFormat::setDefaultFormat(format);
}

int main(int argc, char *argv[])
{
    House house;

    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);
    setSurfaceFormat();

    qmlRegisterType<Room>("RoomClass", 1, 0, "RoomClass");
    qmlRegisterType<Light>("LightClass", 1, 0, "LightClass");

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("house", &house);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));


    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
