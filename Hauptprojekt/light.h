#ifndef LIGHT_H
#define LIGHT_H

#include <QObject>
#include <QVector2D>
#include <QColor>

class Light : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QVector2D position READ position WRITE writePosition NOTIFY positionChanged)
    Q_PROPERTY(QString name READ name NOTIFY nameChanged)
    Q_PROPERTY(QColor color READ color WRITE writeColor NOTIFY colorChanged)

public:
    Light(QObject *parent = nullptr);

    bool isActive() const;

    void writePosition(QVector2D);
    QVector2D position() const;

    QString name() const;
    QColor color() const;
    void writeColor(const QColor& color);

signals:
    void positionChanged();
    void nameChanged();
    void colorChanged();

private:
    bool m_isActive;

    QString m_name;
    QVector2D m_position;
    QColor m_color;

    static int m_lightCount;
};

#endif // LIGHT_H
