#ifndef HOUSE_H
#define HOUSE_H

#include <QObject>
#include <QVector>
//#include <QMqttClient>
#include <qabstractitemmodel.h>

#include "room.h"

class House : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QList<QObject*> modelRooms READ modelRooms NOTIFY roomsChanged)
public:
    House();

    Q_INVOKABLE void addRoom(const QString &roomName);
    Q_INVOKABLE void setClientPort(quint16 port);
    Q_INVOKABLE void setClientHost(QString host);
    Q_INVOKABLE void reconnectMqtt();
    Q_INVOKABLE bool testMqtt();

    Q_INVOKABLE quint16 getClientPort() const;
    Q_INVOKABLE QString getClientHost() const;

    void subscribeToTopics();
    void updateLogStateChange();
    void brokerDisconnected();
    void onConnected();

    QStringList rooms() const;

    QList<QObject *> modelRooms() const;

signals:
    void roomsChanged();

private:
    QVector<Room *> m_rooms;
    QList<QObject *> m_modelRooms;

    //QMqttClient *m_client;
    quint16 m_client_port = quint16(1883);
    QString m_client_host = QString("localhost");
};

#endif // HOUSE_H
