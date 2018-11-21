#ifndef LIGHT_H
#define LIGHT_H

#include <QObject>

class Light : public QObject
{
    Q_OBJECT
public:
    Light(QObject *parent);

    bool isActive() const;

private:
    bool m_isActive;
};

#endif // LIGHT_H
