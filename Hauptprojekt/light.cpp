#include "light.h"

#include <QString>

int Light::m_lightCount = 0;

Light::Light(QObject *parent)
    : QObject{parent}
    , m_isActive{0}
    , m_position{}
    , m_color{"#FFFFFF"}
{
    m_name = "Licht: " + QString(m_lightCount);
    m_lightCount++;
}

bool Light::isActive() const
{
    return m_isActive;
}

void Light::writePosition(QVector2D pos)
{
    m_position = pos;
    positionChanged();
}

QVector2D Light::position() const
{
    return m_position;
}

QString Light::name() const
{
    return m_name;
}

QColor Light::color() const
{
    return m_color;
}

void Light::writeColor(const QColor &color)
{
    m_color = color;
    colorChanged();
}

void Light::setActive(bool active)
{
    this->m_isActive = active;
}

void Light::toggle()
{
    this->m_isActive = !this->m_isActive;
}
