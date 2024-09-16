#ifndef VEHICLEMETRICS_H
#define VEHICLEMETRICS_H

#include <QList>
#include <QObject>

class VehicleMetrics : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int speed READ speed WRITE setSpeed NOTIFY speedChanged FINAL)
    Q_PROPERTY(double batteryPercent READ batteryPercent WRITE setBatteryPercent NOTIFY
                   batteryPercentChanged FINAL)
    Q_PROPERTY(double odoMeter READ odoMeter WRITE setOdoMeter NOTIFY odoMeterChanged FINAL)
    Q_PROPERTY(double rangeMeter READ rangeMeter WRITE setRangeMeter NOTIFY rangeMeterChanged FINAL)
    Q_PROPERTY(int regenLevel READ regenLevel WRITE setRegenLevel NOTIFY regenLevelChanged FINAL)
    Q_PROPERTY(double averageSpeed READ averageSpeed NOTIFY averageSpeedChanged FINAL)
    Q_PROPERTY(
        bool spacePressed READ spacePressed WRITE setSpacePressed NOTIFY spacePressedChanged FINAL)
    Q_PROPERTY(bool simulationRunning READ simulationRunning WRITE setSimulationRunning NOTIFY
                   simulationRunningChanged FINAL)
    Q_PROPERTY(bool isLaunchingAnimation READ isLaunchingAnimation WRITE setIsLaunchingAnimation
                   NOTIFY isLaunchingAnimationChanged FINAL)
    Q_PROPERTY(double distanceTraveled READ distanceTraveled WRITE setDistanceTraveled NOTIFY
                   distanceTraveledChanged)
    Q_PROPERTY(double travelTime READ travelTime WRITE setTravelTime NOTIFY travelTimeChanged)

public:
    explicit VehicleMetrics(QObject *parent = nullptr);

    int speed() const;
    double batteryPercent() const;
    double odoMeter() const;
    double rangeMeter() const;
    int regenLevel() const;
    double averageSpeed() const;
    bool spacePressed() const;
    bool simulationRunning() const;
    bool isLaunchingAnimation() const;
    double distanceTraveled() const;
    double travelTime() const;

public slots:
    void setSpeed(int newSpeed);
    void setBatteryPercent(double newBatteryPercent);
    void setDistanceTraveled(double newDistanceTraveled);
    void setOdoMeter(double newOdoMeter);
    void setRangeMeter(double newRangeMeter);
    void setRegenLevel(int newRegenLevel);
    void setSpacePressed(bool newSpacePressed);
    void setSimulationRunning(bool newsimulationRunning);
    void setIsLaunchingAnimation(bool newIsLaunchingAnimation);
    void handleSpeedUpdate(double speed);
    void handleLaunchAnimation();
    void handleDistanceUpdate(double distanceCovered);
    void handleTotalDistanceUpdate(double totalDistance);
    void handleAccelerationState(bool accelerationState);
    void setTravelTime(double newTravelTime);

signals:
    void speedChanged();
    void batteryPercentChanged();
    void odoMeterChanged();
    void rangeMeterChanged();
    void regenLevelChanged();
    void averageSpeedChanged();
    void spacePressedChanged();
    void simulationRunningChanged();
    void isLaunchingAnimationChanged();
    void distanceTraveledChanged();
    void travelTimeChanged();

private:
    int m_speed;
    double m_batteryPercent = 100;
    double m_odoMeter = 0;
    const double initialRange = 400;
    double m_rangeMeter;
    int m_regenLevel = 1;
    double m_averageSpeed = 0.0;
    QList<int> m_speedList;
    int m_speedCount = 0;
    const int maxSpeedListSize = 100;
    bool m_spacePressed = false;
    bool m_simulationRunning = false;
    bool m_isLaunchingAnimation = true;
    void calculateAverageSpeed();
    double m_distanceTraveled = 0;
    double m_totalDistanceOfRoute;
    bool m_accelerationState = false;
    double m_travelTime;
};

#endif // VEHICLEMETRICS_H
