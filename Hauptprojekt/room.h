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
    Q_PROPERTY(QList<QObject*> modelLights READ modelLights NOTIFY lightsChanged)
public:
    Room();
    Room(const QString &name, QObject *parent = nullptr);
    ~Room();

    QString name() const;

    Q_INVOKABLE void addLight();
    Q_INVOKABLE bool lightsOn();
    Q_INVOKABLE void toggleAllLights();

    QList<QObject *> modelLights() const;

signals:
    void nameChanged();
    void lightsChanged();

private:
    QString m_name;
    QVector<Light*> m_lights;
    QList<QObject *> m_modelLights;

};

#endif // ROOM_H
