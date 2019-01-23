#include "house.h"

#include <QDebug>
#include <QDateTime>

House::House()
{
//    m_client = new QMqttClient(this);

//    connect(m_client, &QMqttClient::stateChanged, this, &House::updateLogStateChange);
//    connect(m_client, &QMqttClient::disconnected, this, &House::brokerDisconnected);

//    connect(m_client, &QMqttClient::messageReceived, this, [this](const QByteArray &message, const QMqttTopicName &topic) {
//        const QString content = QDateTime::currentDateTime().toString()
//                    + QLatin1String(" Received Topic: ")
//                    + topic.name()
//                    + QLatin1String(" Message: ")
//                    + message
//                    + QLatin1Char('\n');
//        qDebug() << content;
//    });

//    connect(m_client, &QMqttClient::connected, this, &House::onConnected);

    addRoom("Living Room");
    addRoom("Bedroom");
}

void House::addRoom(const QString &roomName)
{
    QStringList out;
    out= rooms();
    bool isOkay= out.contains(roomName);
    bool isempty = roomName.isEmpty();
    if (isOkay == false && isempty== false)
        {
        m_rooms.push_back(new Room{roomName, this});

            m_modelRooms.push_back(m_rooms.at(m_rooms.size() -1));

            emit roomsChanged();
        }
    else{

    }
   
}

QStringList House::rooms() const
{
    QStringList out;
    for(int i = 0; i < m_rooms.size(); ++i){
        out << m_rooms.at(i)->name();
    }
    return out;
}

QList<QObject *> House::modelRooms() const
{
    return m_modelRooms;
}

void House::setClientPort(quint16 port) {
    m_client_port = port;
}
void House::setClientHost(QString host) {
    m_client_host = host;
}
void House::reconnectMqtt() {
//    if (m_client->state() != QMqttClient::Disconnected) {
//        m_client->disconnectFromHost();
//    }
//    qDebug() << "Connecting to mqtt broker" << m_client_host << "port:" << m_client_port;
//    //m_client =  new QMqttClient(this);
//    m_client->setHostname(m_client_host);
//    m_client->setPort(m_client_port);
//    m_client->connectToHost();
}

void House::subscribeToTopics() {
//    for(Room* room: m_rooms) {
//        QMqttTopicFilter topicFilter {"house/" + room->name() + "/#"};
//        qDebug() << "Subscribing to topic" << topicFilter.filter() << "valid:" << topicFilter.isValid();
//        auto subscription = m_client->subscribe(topicFilter);
//        if (!subscription) {
//            qDebug() << "Error subscribing to topic" << topicFilter.filter();
//        };

//        if (m_client->publish("house/"+room->name(), ("TestMessageRoom:"+room->name()).toUtf8()) == -1)
//                qDebug() << "Error publishing message";
//    }
}

Q_INVOKABLE quint16 House::getClientPort() const {
    return m_client_port;
}
Q_INVOKABLE QString House::getClientHost() const {
    return m_client_host;
}

Q_INVOKABLE bool House::testMqtt() {
//    if (m_client->publish(QString("house"), QString("House test").toUtf8()) == -1) {
//        qDebug() << "Error publishing test message";
//        return false;
//    }
    return true;
}

void House::updateLogStateChange()
{
    //qDebug() << QDateTime::currentDateTime().toString() << "Client state Changed to:" << m_client->state();
}
void House::brokerDisconnected()
{
    qDebug() << "Broker disconnected";
}

void House::onConnected() {
    qDebug() << "Connection established. Subscribing to topics.";
    subscribeToTopics();
}

