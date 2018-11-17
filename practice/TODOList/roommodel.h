#ifndef ROOMMODEL_H
#define ROOMMODEL_H

#include <QAbstractListModel>

class RoomList;

class roomModel : public QAbstractListModel
{
    Q_OBJECT
    Q_PROPERTY(RoomList *list READ list  WRITE setList)

public:
    explicit roomModel(QObject *parent = nullptr);

    enum {
        OnRole = Qt::UserRole,
        DescriptionRole, ColorRole
    };

    // Basic functionality:
    int rowCount(const QModelIndex &parent = QModelIndex()) const override;

    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;

    // Editable:
    bool setData(const QModelIndex &index, const QVariant &value,
                 int role = Qt::EditRole) override;

    Qt::ItemFlags flags(const QModelIndex& index) const override;

    virtual QHash<int, QByteArray> roleNames() const override;

    RoomList *list() const;
    void setList(RoomList *list);

private:
    RoomList *mList;
};

#endif // ROOMMODEL_H
