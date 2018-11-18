#ifndef LIGHT_H
#define LIGHT_H

#include <QObject>

class Light : public QObject
{
    Q_OBJECT
public:
    Light(QObject *parent);
};

#endif // LIGHT_H
