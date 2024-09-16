#include "include/carmodelcontroller.h"
#include "qdebug.h"

CarModelController::CarModelController(QObject *parent)
    : QObject{parent}
{
    qDebug(__FUNCTION__);
}

CarModelController::~CarModelController()
{
    qDebug() << __FUNCTION__ << "CarModel destroyed.";
}
