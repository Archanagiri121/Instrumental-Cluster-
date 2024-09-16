#ifndef INICONFIGURATION_H
#define INICONFIGURATION_H

#include <QObject>
#include <QSettings>
#include <QString>
#include "../../Navigation/include/navigationcontroller.h"
#include "../../WarningIndicators/include/warningindicatorcontroller.h"
#include "vehiclemetrics.h"
#include "../../TripInfo/include/tripinfocontroller.h"

class IniConfiguration : public QObject
{
    Q_OBJECT

public:
    explicit IniConfiguration(const QString &filename, QObject *parent = nullptr);

    void readAtStart(VehicleMetrics *vehicleMetrics, NavigationController *navigationController,  TripInfoController *tripInfoController);
    void updateIniFile(VehicleMetrics *vehicleMetrics, WarningIndicatorController *warningIndicator ,  TripInfoController *tripInfoController);
    void createDefaultIniFile();

signals:

private:
    QString fileName;
    int groupId;
};

#endif // INICONFIGURATION_H
