#ifndef ROOMLIST_H
#define ROOMLIST_H

#include <QObject>
#include <QVector>

struct RoomItem{
    bool on;
    QString description;
    QString color;
};

class RoomList : public QObject
{
    Q_OBJECT
public:
    explicit RoomList(QObject *parent = nullptr);

    QVector<RoomItem> items() const;

    bool setItemAt(int index, const RoomItem &item);

signals:
    void preItemAppended();
    void postItemAppended();

    void preItemRemoved(int index);
    void postItemRemoved();

public slots:
    void appendItem();
    //void removeCompletedItems();

private:
    QVector<RoomItem> mRooms;

};

#endif // ROOMLIST_H
