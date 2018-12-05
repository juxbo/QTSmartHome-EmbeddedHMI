#ifndef ROOMMODEL_H
#define ROOMMODEL_H

#include <QObject>
#include <Qt3DRender/Qt3DRender>

struct DrawVBOData {
    QVector3D position;
};
class RoomModel : public Qt3DCore::QNode
{
        Q_OBJECT
        // Make properties available in QML
        Q_PROPERTY(Qt3DRender::QBuffer *buffer READ buffer CONSTANT)
        Q_PROPERTY(int count READ count NOTIFY countChanged)
public:
    RoomModel(Qt3DCore::QNode *parent = nullptr);

        Qt3DRender::QBuffer *buffer();
        void setData(const QVector<QVector3D> &positions);
        int count() const;

    signals:
        void countChanged(int count);

    public slots:

    private:
        QScopedPointer<Qt3DRender::QBuffer> m_buffer;
        int m_count = 0;
    };

#endif // ROOMMODEL_H
