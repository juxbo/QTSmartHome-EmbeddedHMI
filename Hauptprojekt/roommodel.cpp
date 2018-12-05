#include "roommodel.h"

RoomModel::RoomModel(Qt3DCore::QNode *parent)
    : Qt3DCore::QNode(parent)
    , m_buffer(new Qt3DRender::QBuffer(Qt3DRender::QBuffer::VertexBuffer, this))
{
    QVector<QVector3D> tmp;
    tmp.push_back(QVector3D(1, -1, -10));
    tmp.push_back(QVector3D(-1, -1, -10));
    tmp.push_back(QVector3D(-1, 1, -10));
    setData(tmp);
}

Qt3DRender::QBuffer *RoomModel::buffer() { return m_buffer.data();}

void RoomModel::setData(const QVector<QVector3D> &positions) {
    QByteArray ba;
    ba.resize(positions.size() * sizeof(DrawVBOData));
    DrawVBOData *vboData = reinterpret_cast<DrawVBOData *>(ba.data());
    for (int i = 0; i < positions.size(); i++) {
        DrawVBOData &vbo = vboData[i];
        vbo.position = positions[i];
    }
    m_buffer->setData(ba);
    m_count = positions.count();
    emit countChanged(m_count);
}

int RoomModel::count() const { return m_count; }
