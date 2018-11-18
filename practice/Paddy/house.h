#ifndef HOUSE_H
#define HOUSE_H

#include <QObject>
#include <QVector>
#include <qabstractitemmodel.h>

#include "room.h"

class House : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QList<QObject*> modelRooms READ modelRooms NOTIFY roomsChanged)
public:
    House();

    Q_INVOKABLE void addRoom(const QString &roomName);

    QStringList rooms() const;

    QList<QObject *> modelRooms() const;

signals:
    void roomsChanged();

private:
    QVector<Room *> m_rooms;

    QList<QObject *> m_modelRooms;
};

#endif // HOUSE_H
