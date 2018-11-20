#ifndef ROOM_H
#define ROOM_H

#include <QObject>
#include <QString>
#include <QVector>

#include "light.h"

class Room : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString name READ name NOTIFY nameChanged)
public:
    Room();
    Room(const QString &name, QObject *parent = nullptr);
    ~Room();

    QString name() const;

    Q_INVOKABLE void addLight();
    Q_INVOKABLE bool lightsOn();

signals:
    void nameChanged();

private:
    QString m_name;
    QVector<Light*> m_lights;
};

#endif // ROOM_H
