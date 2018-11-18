#include "room.h"

#include <QDebug>

Room::Room()
{

}

Room::Room(const QString &name, QObject *parent)
    : QObject{parent}
    , m_name{name}
    , lights{}
{}

Room::~Room()
{}

void Room::addLight()
{
    qDebug() << "New Light";
    lights.push_back(new Light{this});
}

QString Room::name() const
{
    return m_name;
}
