#include "roommodel.h"
#include "roomlist.h"

roomModel::roomModel(QObject *parent)
    : QAbstractListModel(parent), mList(nullptr)
{
}

int roomModel::rowCount(const QModelIndex &parent) const
{
    // For list models only the root node (an invalid parent) should return the list's size. For all
    // other (valid) parents, rowCount() should return 0 so that it does not become a tree model.
    if (parent.isValid() || !mList)
        return 0;

    return mList->items().size();
}

QVariant roomModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid() || !mList)
        return QVariant();

    // FIXME: Implement me!
    const RoomItem item = mList->items().at(index.row());
    switch(role) {
    case OnRole:
        return QVariant(item.on);
    case DescriptionRole:
        return QVariant(item.description);
    case ColorRole:
        return QVariant(item.color);
    }
    return QVariant();
}

bool roomModel::setData(const QModelIndex &index, const QVariant &value, int role)
{
    if(!mList)
        return false;
    RoomItem item = mList->items().at(index.row());
    switch(role) {
    case OnRole:
        item.on = value.toBool();
        break;
    case DescriptionRole:
        item.description = value.toString();
        break;
    case ColorRole:
        item.color = value.toString();
        break;
    }

    if (mList->setItemAt(index.row(), item)) {
        emit dataChanged(index, index, QVector<int>() << role);
        return true;
    }
    return false;
}

Qt::ItemFlags roomModel::flags(const QModelIndex &index) const
{
    if (!index.isValid())
        return Qt::NoItemFlags;

    return Qt::ItemIsEditable;
}

QHash<int, QByteArray> roomModel::roleNames() const
{
    QHash<int, QByteArray> names;
    names[OnRole] = "on";
    names[DescriptionRole] = "description";
    names[ColorRole] = "color";
    return names;
}

RoomList *roomModel::list() const
{
    return mList;
}

void roomModel::setList(RoomList *list)
{
    beginResetModel();

    if(mList)
        mList->disconnect(this);

    mList = list;

    if(mList){
        connect(mList, &RoomList::preItemAppended, this, [=]() {
            const int index = mList->items().size();
            beginInsertRows(QModelIndex(), index, index);
        });
        connect(mList, &RoomList::postItemAppended, this, [=]() {
            endInsertRows();
        });
        connect(mList, &RoomList::preItemRemoved, this, [=](int index) {
            beginRemoveRows(QModelIndex(), index, index);
        });
        connect(mList, &RoomList::postItemRemoved, this, [=]() {
            endRemoveRows();
        });

        endResetModel();
    }
}
