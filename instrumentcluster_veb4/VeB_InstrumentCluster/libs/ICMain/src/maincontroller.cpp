#include "include/maincontroller.h"

#include <QDebug>
#include <QFile>
#include <QQmlEngine>

MainController::MainController(QGuiApplication &app, QQmlApplicationEngine *engine, QObject *parent)
    : QObject{parent}
    , m_app(app)
    , m_engine(engine)

{
    qDebug(__FUNCTION__);

    QDir directoryObj("C:/IConfiguration");
    {
        if (!directoryObj.exists()) {
            qDebug() << "No conf folder found. Creating ...";
            directoryObj.mkdir("C:/IConfiguration");
        }
    }

    m_navigationController = new NavigationController(this);
    m_tripInfoController = new TripInfoController(this);
    m_warningIndicatorController = new WarningIndicatorController(this);
    m_carModelController = new CarModelController(this);
    m_simulationController = new SimulationController(this);
    m_vehicleMetrics = new VehicleMetrics(this);
    m_menuSelection = new MenuSelection(this);
    m_weatherApi = new WeatherApi(this);

    QFile settingsFile(filename);
    if (!settingsFile.exists()) {
        qDebug() << "Config file not found. Creating ...";
        m_iniConfiguration = new IniConfiguration(filename, this);
        m_iniConfiguration->createDefaultIniFile();
        m_iniConfiguration->readAtStart(m_vehicleMetrics, m_navigationController, m_tripInfoController);
    } else {
        m_iniConfiguration = new IniConfiguration(filename, this);
        m_iniConfiguration->readAtStart(m_vehicleMetrics, m_navigationController , m_tripInfoController);
    }
    settingsFile.close();

    m_keyhandler = new Keyhandler(m_warningIndicatorController,
                                  m_vehicleMetrics,
                                  m_menuSelection,
                                  m_simulationController,
                                  this);

    connect(m_simulationController->speedSimulator(), &SpeedSimulator::speedUpdated,m_vehicleMetrics, &VehicleMetrics::handleSpeedUpdate);
    connect(m_simulationController->speedSimulator(),
            &SpeedSimulator::distanceUpdated,
            m_vehicleMetrics,
            &VehicleMetrics::handleDistanceUpdate);
    connect(m_simulationController->speedSimulator(),
            &SpeedSimulator::totalDistanceUpdated,
            m_vehicleMetrics,
            &VehicleMetrics::handleTotalDistanceUpdate);
    connect(m_simulationController->speedSimulator(),
            &SpeedSimulator::accelerationStateChanged,
            m_vehicleMetrics,
            &VehicleMetrics::handleAccelerationState);
    connect(m_warningIndicatorController,
            &WarningIndicatorController::launchAnimationFinished,
            m_vehicleMetrics,
            &VehicleMetrics::handleLaunchAnimation);
    connect(m_keyhandler, &Keyhandler::escapeKeyPressed, this, &MainController::handleAppQuit);

    // Connect signals from VehicleMetrics to slots in TripData via TripInfoController
    QObject::connect(m_vehicleMetrics, &VehicleMetrics::distanceTraveledChanged, [&]() {
        m_tripInfoController->tripData()->updateTripA(m_vehicleMetrics->distanceTraveled(), m_vehicleMetrics->travelTime(), m_vehicleMetrics->averageSpeed(),  m_vehicleMetrics->batteryPercent());
    });

    QObject::connect(m_vehicleMetrics, &VehicleMetrics::travelTimeChanged, [&]() {
         m_tripInfoController->tripData()->updateTripA(m_vehicleMetrics->distanceTraveled(), m_vehicleMetrics->travelTime(), m_vehicleMetrics->averageSpeed(),  m_vehicleMetrics->batteryPercent());
    });

    QObject::connect(m_vehicleMetrics, &VehicleMetrics::averageSpeedChanged, [&]() {
         m_tripInfoController->tripData()->updateTripA(m_vehicleMetrics->distanceTraveled(), m_vehicleMetrics->travelTime(), m_vehicleMetrics->averageSpeed(),  m_vehicleMetrics->batteryPercent());
    });
    QObject::connect(m_vehicleMetrics, &VehicleMetrics::batteryPercentChanged, [&]() {
        m_tripInfoController->tripData()->updateTripA(m_vehicleMetrics->distanceTraveled(), m_vehicleMetrics->travelTime(), m_vehicleMetrics->averageSpeed(), m_vehicleMetrics->batteryPercent());
    });
}

void MainController::unloadQml()
{
    if (m_engine) {
        m_engine->clearComponentCache();
        QList<QObject *> rootObjects = m_engine->rootObjects();
        for (QObject *obj : rootObjects) {
            obj->deleteLater();
        }
        qDebug() << "main.qml unloaded";
    }
}

NavigationController *MainController::navigationController() const
{
    return m_navigationController;
}


TripInfoController *MainController::tripInfoController() const
{
    return m_tripInfoController;
}

WarningIndicatorController *MainController::warningIndicatorController() const
{
    return m_warningIndicatorController;
}

CarModelController *MainController::carModelController() const
{
    return m_carModelController;
}

SimulationController *MainController::simulationController() const
{
    return m_simulationController;
}

VehicleMetrics *MainController::vehicleMetrics() const
{
    return m_vehicleMetrics;
}

MenuSelection *MainController::menuSelection() const
{
    return m_menuSelection;
}

Keyhandler *MainController::keyhandler() const
{
    return m_keyhandler;
}

WeatherApi *MainController::weatherApi() const
{
    return m_weatherApi;
}

MainController::~MainController(){
    delete  m_simulationController;
    delete m_carModelController;
    delete  m_warningIndicatorController;
    delete m_tripInfoController;
    delete m_navigationController;
    delete m_weatherApi;

    qDebug() << __FUNCTION__ << "Main Destructor called";
}

void MainController::handleBatteryLow()
{
    m_vehicleMetrics->setRangeMeter(380);
    handleAppQuit();
}

void MainController::handleAppQuit()
{
    m_iniConfiguration->updateIniFile(m_vehicleMetrics, m_warningIndicatorController, m_tripInfoController);
    unloadQml();
    m_app.quit();
}
