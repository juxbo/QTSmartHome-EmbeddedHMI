#include "light.h"

Light::Light(QObject *parent)
    : QObject{parent}
    , m_isActive{0}
{}

bool Light::isActive() const
{
    return m_isActive;
}
