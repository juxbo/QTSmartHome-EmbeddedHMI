#include "room.h"

#include <QDebug>


Room::Room()
{

}

Room::Room(const QString &name, QObject *parent)
    : QObject{parent}
    , m_name{name}
    , m_lights{}
    , m_modelLights{}
{
    addLight();
}

Room::~Room()
{}

void Room::addLight()
{
    if(m_lights.size() < 7){
        Light* tmp = new Light{this};
        m_lights.push_back(tmp);
        m_modelLights.push_back(tmp);

        lightsChanged();
    }
}

bool Room::lightsOn()
{
    for(int i = 0; i < m_lights.size(); ++i){
        if(m_lights.at(i)->isActive()) {
            return true;
        }
    }
    return false;
}

QList<QObject *> Room::modelLights() const
{
    return m_modelLights;
}

void Room::toggleAllLights()
{
    qDebug() << "Toggle all lights in room" << m_name;
    const bool stateToSet = !this->lightsOn();

    for (auto light : m_lights) {
        light->setActive(stateToSet);
    }
}

QString Room::name() const
{
    return m_name;
}
