#include "include/tripdata.h"

TripData::TripData()
{
    Trip dataA = {"Pune", "Nagpur", 1000.00, 1.23, 144, 32.3};
    m_trips.append(dataA);
    Trip dataB = Trip{"Alandi", "Pune", 1200.0, 1.23, 144, 32.3};
    m_trips.append(dataB);
}

int TripData::rowCount(const QModelIndex& parent) const
{
    if (parent.isValid())
        return 0;

    return m_trips.size();
}

QVariant TripData::data(const QModelIndex& index, int role) const
{
    if (index.row() < 0 || index.row() >= m_trips.count()) {
        return QVariant();
    }
    const QString from_location = m_trips[index.row()].travelFrom;
    const QString to_location = m_trips[index.row()].travelTo;
    const double travel_distance = m_trips[index.row()].travelDistance;
    const double travel_time = m_trips[index.row()].travelTime;
    const double travel_avg_speed = m_trips[index.row()].travelAvergaeSpeed;
    const double travel_discharge = m_trips[index.row()].travelEnergy;

    if (role == 0) {
        return from_location;
    }
    if (role == 1) {
        return to_location;
    }
    if (role == 2) {
        return travel_distance;
    }
    if (role == 3) {
        return travel_time;
    }
    if (role == 4) {
        return travel_avg_speed;
    }
    if (role == 5) {
        return travel_discharge;
    }

    return QVariant();
}

QHash<int, QByteArray> TripData::roleNames() const
{
    QHash<int, QByteArray> roles;

    roles[0] = "fromLocation";
    roles[1] = "toLocation";
    roles[2] = "travelDistance";
    roles[3] = "traveltime";
    roles[4] = "travelavgSpeed";
    roles[5] = "travelDischarge";

    return roles;
}

void TripData::clearData(int index)
{
    beginResetModel();
    if (index == 0) {
        m_trips.pop_front();
        m_trips.push_front({"-", "-", 0.0, 0.0, 0.0, 0.0});
    } else {
        m_trips.pop_back();
        m_trips.push_back({"-", "-", 0.0, 0.0, 0.0, 0.0});
    }
    endResetModel();
}

void TripData::updateData(int index,
                          QString from,
                          QString to,
                          double traveledDistance,
                          double traveledTime,
                          double traveledAvergaeSpeed,
                          double traveledEnergyConsume)
{
    beginResetModel();
    if (index == 0) {
        m_trips.pop_front();
        m_trips.push_front(
            {from, to, traveledDistance, traveledTime, traveledAvergaeSpeed, traveledEnergyConsume});
    } else {
        m_trips.pop_back();
        m_trips.push_back(
            {from, to, traveledDistance, traveledTime, traveledAvergaeSpeed, traveledEnergyConsume});
    }
    endResetModel();
}


void TripData::updateTripA(double traveledDistance, double traveledTime, double traveledAverageSpeed , double travel_discharge)
{
    if (!m_trips.isEmpty()) {
        m_trips[0].travelDistance = traveledDistance;
        m_trips[0].travelTime = traveledTime;
        m_trips[0].travelAvergaeSpeed = traveledAverageSpeed;
         m_trips[0].travelEnergy = convertPercentToKWh(travel_discharge);
        emit dataChanged(this->index(0), this->index(0));
    }
}

double TripData::convertPercentToKWh(double percent)
{
    const double maxKWh = 40.0;
    return (percent / 100.0) * maxKWh;
}

void TripData::updateTripB(double traveledDistance, double traveledTime, double traveledAverageSpeed)
{
    if (m_trips.size() > 1) {
        m_trips[1].travelDistance = traveledDistance;
        m_trips[1].travelTime = traveledTime;
        m_trips[1].travelAvergaeSpeed = traveledAverageSpeed;
        emit dataChanged(this->index(1), this->index(1));
    }
}
