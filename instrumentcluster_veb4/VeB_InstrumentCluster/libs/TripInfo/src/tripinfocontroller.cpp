#include "include/tripinfocontroller.h"

TripInfoController::TripInfoController(QObject *parent)
    : QObject{parent}
{
    m_tripData = new TripData;
    qDebug(__FUNCTION__);
}
TripInfoController::~TripInfoController()
{
    qDebug() << __FUNCTION__ << "TripInfoController destroyed.";
}

TripData *TripInfoController::tripData() const
{
    return m_tripData;
}
