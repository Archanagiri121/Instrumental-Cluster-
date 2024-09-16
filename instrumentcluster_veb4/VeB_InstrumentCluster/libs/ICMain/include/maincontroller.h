#ifndef MAINCONTROLLER_H
#define MAINCONTROLLER_H

#include <QDir>
#include <QGuiApplication>
#include <QKeyEvent>
#include <QObject>
#include <QQmlApplicationEngine>
#include "../../CarModel/include/carmodelcontroller.h"
#include "../../ICMain/include/WeatherApi.h"
#include "../../ICMain/include/iniconfiguration.h"
#include "../../ICMain/include/keyhandler.h"
#include "../../ICMain/include/menuselection.h"
#include "../../ICMain/include/vehiclemetrics.h"
#include "../../ICSimulation/include/simulationcontroller.h"
#include "../../Navigation/include/navigationcontroller.h"
#include "../../TripInfo/include/tripinfocontroller.h"
#include "../../WarningIndicators/include/warningindicatorcontroller.h"

const QString filename = "C:/IConfiguration/config.ini";

class MainController : public QObject
{
    Q_OBJECT
    Q_PROPERTY(NavigationController *navigationController READ navigationController CONSTANT)
    Q_PROPERTY(TripInfoController *tripInfoController READ tripInfoController CONSTANT)
    Q_PROPERTY(WarningIndicatorController *warningIndicatorController READ
                   warningIndicatorController CONSTANT)
    Q_PROPERTY(CarModelController *carModelController READ carModelController CONSTANT)
    Q_PROPERTY(SimulationController *simulationController READ simulationController CONSTANT)
    Q_PROPERTY(VehicleMetrics *vehicleMetrics READ vehicleMetrics CONSTANT)
    Q_PROPERTY(MenuSelection *menuSelection READ menuSelection CONSTANT)
    Q_PROPERTY(Keyhandler *keyhandler READ keyhandler CONSTANT)
    Q_PROPERTY(WeatherApi *weatherApi READ weatherApi CONSTANT)

public:
    explicit MainController(QGuiApplication &app,
                            QQmlApplicationEngine *engine,
                            QObject *parent = nullptr);

    NavigationController *navigationController() const;
    TripInfoController *tripInfoController() const;
    WarningIndicatorController *warningIndicatorController() const;
    CarModelController *carModelController() const;
    SimulationController *simulationController() const;
    VehicleMetrics *vehicleMetrics() const;
    Keyhandler *keyhandler() const;
    MenuSelection *menuSelection() const;
    WeatherApi *weatherApi() const;
    ~MainController();

public slots:
    void handleAppQuit();
    void unloadQml();
    void handleBatteryLow();

private:
    QGuiApplication &m_app;
    QQmlApplicationEngine *m_engine;
    NavigationController *m_navigationController = nullptr;
    TripInfoController *m_tripInfoController = nullptr;
    WarningIndicatorController *m_warningIndicatorController = nullptr;
    CarModelController *m_carModelController = nullptr;
    SimulationController *m_simulationController = nullptr;
    VehicleMetrics *m_vehicleMetrics = nullptr;
    Keyhandler *m_keyhandler = nullptr;
    IniConfiguration *m_iniConfiguration = nullptr;
    MenuSelection *m_menuSelection = nullptr;
    WeatherApi *m_weatherApi = nullptr;

signals:
};

#endif // MAINCONTROLLER_H
