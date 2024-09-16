#include "include/vehiclemetrics.h"
#include <QDebug>

VehicleMetrics::VehicleMetrics(QObject *parent)
    : QObject{parent}
    , m_rangeMeter(initialRange)
    , m_totalDistanceOfRoute(0)
    , m_distanceTraveled(0)
    , m_speed(0)
    , m_odoMeter(0)
    , m_accelerationState(false)
{}

int VehicleMetrics::speed() const
{
    return m_speed;
}

void VehicleMetrics::setSpeed(int newSpeed)
{
    if (m_totalDistanceOfRoute <= m_distanceTraveled) {
        setDistanceTraveled(m_distanceTraveled + ((newSpeed * 0.1) / 3600.0));
    }

    m_speedList.append(newSpeed);
    m_speedCount++;

    calculateAverageSpeed();

    m_speed = newSpeed;
    emit speedChanged();
}

void VehicleMetrics::handleSpeedUpdate(double speed)
{
    setSpeed(static_cast<int>(speed));
}

void VehicleMetrics::handleLaunchAnimation()
{
    setIsLaunchingAnimation(false);
}

void VehicleMetrics::handleDistanceUpdate(double distanceCovered)
{
    if (m_totalDistanceOfRoute > m_distanceTraveled) {
        setDistanceTraveled(distanceCovered);
    }
}

void VehicleMetrics::handleTotalDistanceUpdate(double totalDistance)
{
    m_totalDistanceOfRoute = totalDistance;
}

void VehicleMetrics::handleAccelerationState(bool accelerationState)
{
    if (!m_isLaunchingAnimation) {
        m_accelerationState = accelerationState;
    }
}

void VehicleMetrics::calculateAverageSpeed()
{
    double sum = 0;
    for (int speed : std::as_const(m_speedList)) {
        sum += speed;
    }

    m_averageSpeed = sum / m_speedCount;

    if (m_speedList.size() >= maxSpeedListSize) {
        double bucketSum = sum;
        m_speedList.clear();
        m_speedList.append(bucketSum);
    }
    emit averageSpeedChanged();
}

double VehicleMetrics::batteryPercent() const
{
    return m_batteryPercent;
}

void VehicleMetrics::setBatteryPercent(double newBatteryPercent)
{
    if (newBatteryPercent < 0)
        newBatteryPercent = 0;

    if (m_batteryPercent == newBatteryPercent)
        return;

    m_batteryPercent = newBatteryPercent;
    emit batteryPercentChanged();
}

double VehicleMetrics::odoMeter() const
{
    return m_odoMeter;
}

void VehicleMetrics::setOdoMeter(double newOdoMeter)
{
    m_odoMeter = newOdoMeter;
    emit odoMeterChanged();
}

double VehicleMetrics::rangeMeter() const
{
    return m_rangeMeter;
}

void VehicleMetrics::setRangeMeter(double newRangeMeter)
{
    if (newRangeMeter < 0)
        newRangeMeter = 0;

    if (m_rangeMeter == newRangeMeter)
        return;
    m_rangeMeter = newRangeMeter;
    setBatteryPercent((m_rangeMeter / initialRange) * 100);
    emit rangeMeterChanged();
}

int VehicleMetrics::regenLevel() const
{
    return m_regenLevel;
}

void VehicleMetrics::setRegenLevel(int newRegenLevel)
{
    if (m_regenLevel == newRegenLevel)
        return;
    m_regenLevel = newRegenLevel;
    emit regenLevelChanged();
}

double VehicleMetrics::averageSpeed() const
{
    return m_averageSpeed;
}

bool VehicleMetrics::spacePressed() const
{
    return m_spacePressed;
}

void VehicleMetrics::setSpacePressed(bool newSpacePressed)
{
    m_spacePressed = newSpacePressed;
    emit spacePressedChanged();
}

bool VehicleMetrics::simulationRunning() const
{
    return m_simulationRunning;
}

void VehicleMetrics::setSimulationRunning(bool newsimulationRunning)
{
    m_simulationRunning = newsimulationRunning;
    emit simulationRunningChanged();
}

bool VehicleMetrics::isLaunchingAnimation() const
{
    return m_isLaunchingAnimation;
}

void VehicleMetrics::setIsLaunchingAnimation(bool newIsLaunchingAnimation)
{
    if (m_isLaunchingAnimation == newIsLaunchingAnimation)
        return;
    m_isLaunchingAnimation = newIsLaunchingAnimation;
    emit isLaunchingAnimationChanged();
}

double VehicleMetrics::distanceTraveled() const
{
    return m_distanceTraveled;
}

void VehicleMetrics::setDistanceTraveled(double newDistanceTraveled)
{
    if (m_distanceTraveled != newDistanceTraveled) {
        double distanceIncrement = newDistanceTraveled - m_distanceTraveled;
        m_distanceTraveled = newDistanceTraveled;
        if (m_rangeMeter > 0 && !m_isLaunchingAnimation) {
            if (m_spacePressed || m_accelerationState) {
                setRangeMeter(m_rangeMeter - distanceIncrement);
            }
            setOdoMeter(m_odoMeter + distanceIncrement);
        }
        emit distanceTraveledChanged();
    }
}

double VehicleMetrics::travelTime() const
{
    return m_travelTime;
}

void VehicleMetrics::setTravelTime(double newTravelTime)
{
    m_travelTime = newTravelTime;
    emit travelTimeChanged();
}
