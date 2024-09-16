#ifndef TRIPDATA_H
#define TRIPDATA_H

#include <QObject>
#include <QAbstractListModel>
#include <QString>
#include <QVariant>

struct Trip {
    QString travelFrom;
    QString travelTo;
    double travelDistance;
    double travelTime;
    double travelAvergaeSpeed;
    double travelEnergy;
};

class TripData : public QAbstractListModel
{
    Q_OBJECT
public:
    explicit TripData();

    int rowCount(const QModelIndex& parent = QModelIndex()) const override;
    QVariant data(const QModelIndex& index, int role) const override;
    QHash<int, QByteArray> roleNames() const override;

    Q_INVOKABLE void clearData(int index);
    Q_INVOKABLE void updateData(int index,
                                QString from,
                                QString to,
                                double traveledDistance,
                                double traveledTime,
                                double traveledAvergaeSpeed,
                                double traveledEnergyConsume);

public slots:
    void updateTripA(double traveledDistance, double traveledTime, double traveledAverageSpeed , double travel_discharge);
    void updateTripB(double traveledDistance, double traveledTime, double traveledAverageSpeed);

private:
    QList<Trip> m_trips;
    double convertPercentToKWh(double percent);
};

#endif // TRIPDATA_H
