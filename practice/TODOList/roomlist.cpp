#include "roomlist.h"

RoomList::RoomList(QObject *parent) : QObject(parent)
{
    mRooms.append({false, QStringLiteral("Wohnzimmer"), "green"});
    mRooms.append({false, QStringLiteral("Schlafzimmer"), "red"});
    mRooms.append({true, QStringLiteral("Flur"), "yellow"});
}

QVector<RoomItem> RoomList::items() const
{
    return mRooms;
}

bool RoomList::setItemAt(int index, const RoomItem &item)
{
    if(index < 0 || index >= mRooms.size())
        return false;

    //const RoomItem &oldItem = mRooms.at(index);

    mRooms[index] = item;
    return true;
}

void RoomList::appendItem()
{
    emit preItemAppended();

    RoomItem item;
    item.on = false;
    mRooms.append(item);

    emit postItemAppended();
}
