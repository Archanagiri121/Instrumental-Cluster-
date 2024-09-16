#include "include/iniconfiguration.h"
#include <QCoreApplication>
#include <QDebug>
#include <QFile>
#include "../../Navigation/include/navigationcontroller.h"
#include "include/vehiclemetrics.h"

IniConfiguration::IniConfiguration(const QString &filename, QObject *parent)
    : QObject{parent}
    , groupId(1)
{
    fileName = filename;
}

void IniConfiguration::createDefaultIniFile()
{
    QSettings settings(fileName, QSettings::IniFormat);
    qDebug() << "Creating default INI file";

    settings.setValue("GroupID", 1);

    settings.beginGroup("Metrics");
    settings.setValue("Odometer", 0.0);
    settings.setValue("Range", 400.0);
    settings.setValue("RegenLevel", 1);
    settings.setValue("BatteryPercentage", 100.0);
    settings.setValue("GearState", 0);
    settings.endGroup();

    settings.beginGroup("Navigation1");
    settings.setValue("StartLatitude", 18.532387);
    settings.setValue("StartLongitude", 73.876730);
    settings.setValue("StartLocationName", "Verolt, Pune");
    settings.setValue("EndLatitude", 18.519346774874595);
    settings.setValue("EndLongitude", 73.8545525557375);
    settings.setValue("EndLocationName", "Shaniwar Wada, Pune");
    settings.endGroup();

    settings.beginGroup("Navigation2");
    settings.setValue("StartLatitude", 18.532387);
    settings.setValue("StartLongitude", 73.876730);
    settings.setValue("StartLocationName", "Verolt, Pune");
    settings.setValue("EndLatitude", 18.944605);
    settings.setValue("EndLongitude", 72.822404);
    settings.setValue("EndLocationName", "Marine Drive, Mumbai");
    settings.endGroup();

    settings.beginGroup("Navigation3");
    settings.setValue("StartLatitude", 18.532387);
    settings.setValue("StartLongitude", 73.876730);
    settings.setValue("StartLocationName", "Verolt, Pune");
    settings.setValue("EndLatitude", 19.996842);
    settings.setValue("EndLongitude", 73.790517);
    settings.setValue("EndLocationName", "Nashik");
    settings.endGroup();

    // TripData
    settings.beginGroup("TripA");
    settings.setValue("TravelDistance", 0.0);
    settings.setValue("TravelTime", 0.0);
    settings.setValue("TravelAvgSpeed", 0.0);
    settings.setValue("TravelDischarge", 0.0);
    settings.endGroup();

    settings.beginGroup("TripB");
    settings.setValue("TravelDistance", 120.0);
    settings.setValue("TravelTime", 3.69);
    settings.setValue("TravelAvgSpeed", 62.0);
    settings.setValue("TravelDischarge", 12.0);
    settings.endGroup();
}

void IniConfiguration::readAtStart(VehicleMetrics *vehicleMetrics,
                                   NavigationController *navigationController ,TripInfoController *tripInfoController)
{
    qDebug() << "Reading and updating values FROM INI file";

    QSettings settings(fileName, QSettings::IniFormat);

    groupId = settings.value("GroupID", 1).toInt();

    settings.beginGroup("Metrics");
    vehicleMetrics->setOdoMeter(settings.value("Odometer", 0.0).toDouble());
    vehicleMetrics->setRangeMeter(settings.value("Range", 0.0).toDouble());
    vehicleMetrics->setRegenLevel(settings.value("RegenLevel", 0).toInt());
    vehicleMetrics->setBatteryPercent(settings.value("BatteryPercentage", 100.0).toDouble());
    settings.endGroup();

    QString groupName;
    switch (groupId) {
    case 1:
        groupName = "Navigation1";
        break;
    case 2:
        groupName = "Navigation2";
        break;
    case 3:
        groupName = "Navigation3";
        break;
    default:
        qWarning() << "Invalid group ID" << groupId;
        return;
    }

    settings.beginGroup(groupName);
    navigationController->setStartPointLatitude(settings.value("StartLatitude").toString());
    navigationController->setStartPointLongitude(settings.value("StartLongitude").toString());
    navigationController->setEndPointLatitude(settings.value("EndLatitude").toString());
    navigationController->setEndPointLongitude(settings.value("EndLongitude").toString());
    navigationController->setStartLocationName(settings.value("StartLocationName").toString());
    navigationController->setEndLocationName(settings.value("EndLocationName").toString());
    settings.endGroup();


    // Read TripData
    settings.beginGroup("TripA");
    tripInfoController->tripData()->updateData(0, navigationController->startLocationName(), navigationController->endLocationName(),
                         settings.value("TravelDistance", 0.0).toDouble(),
                         settings.value("TravelTime", 0.0).toDouble(),
                         settings.value("TravelAvgSpeed", 0.0).toDouble(),
                         settings.value("TravelDischarge", 0.0).toDouble());
    settings.endGroup();

    settings.beginGroup("TripB");
   tripInfoController->tripData()->updateData(1, "Verolt, Pune", "Marine Drive, Mumbai",
                         settings.value("TravelDistance", 120.0).toDouble(),
                         settings.value("TravelTime", 3.69).toDouble(),
                         settings.value("TravelAvgSpeed", 62.0).toDouble(),
                         settings.value("TravelDischarge", 12.0).toDouble());
    settings.endGroup();
}

void IniConfiguration::updateIniFile(VehicleMetrics *vehicleMetrics,
                                     WarningIndicatorController *warningIndicator , TripInfoController *tripInfoController)
{
    QSettings settings(fileName, QSettings::IniFormat);

    qDebug() << "Updating values in INI file" << settings.fileName();

    settings.beginGroup("Metrics");
    settings.setValue("Odometer", vehicleMetrics->odoMeter());
    settings.setValue("Range", vehicleMetrics->rangeMeter());
    settings.setValue("RegenLevel", vehicleMetrics->regenLevel());
    settings.setValue("BatteryPercentage", vehicleMetrics->batteryPercent());
    settings.setValue("GearState", warningIndicator->gearState());
    settings.endGroup();

    settings.setValue("GroupID", groupId);

    // Update TripData
    settings.beginGroup("TripA");
    QModelIndex indexA = tripInfoController->tripData()->index(0);
    settings.setValue("TravelDistance", tripInfoController->tripData()->data(indexA, 2).toDouble());
    settings.setValue("TravelTime", tripInfoController->tripData()->data(indexA, 3).toDouble());
    settings.setValue("TravelAvgSpeed", tripInfoController->tripData()->data(indexA, 4).toDouble());
    settings.setValue("TravelDischarge",tripInfoController->tripData()->data(indexA, 5).toDouble());
    settings.endGroup();

    settings.beginGroup("TripB");
    QModelIndex indexB = tripInfoController->tripData()->index(1);
    settings.setValue("TravelDistance", tripInfoController->tripData()->data(indexB, 2).toDouble());
    settings.setValue("TravelTime", tripInfoController->tripData()->data(indexB, 3).toDouble());
    settings.setValue("TravelAvgSpeed", tripInfoController->tripData()->data(indexB, 4).toDouble());
    settings.setValue("TravelDischarge", tripInfoController->tripData()->data(indexB, 5).toDouble());
    settings.endGroup();
}
