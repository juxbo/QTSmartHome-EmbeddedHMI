#include "room.h"

#include <QDebug>

Room::Room()
{

}

Room::Room(const QString &name, QObject *parent)
    : QObject{parent}
    , m_name{name}
    , m_lights{}
{
    addLight();
}

Room::~Room()
{}

void Room::addLight()
{
    qDebug() << "New Light";
    m_lights.push_back(new Light{this});
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
