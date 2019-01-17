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
        if(m_lights.at(i)->isActive()){
            return true;
        }
    }
    return false;
}

QList<QObject *> Room::modelLights() const
{
    return m_modelLights;
}

QString Room::name() const
{
    return m_name;
}
