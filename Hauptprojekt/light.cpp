#include "light.h"

Light::Light(QObject *parent)
    : QObject{parent}
    , m_isActive{0}
{}

bool Light::isActive() const
{
    return m_isActive;
}

void Light::setActive(bool active)
{
    this->m_isActive = active;
}

void Light::toggle()
{
    this->m_isActive = !this->m_isActive;
}
