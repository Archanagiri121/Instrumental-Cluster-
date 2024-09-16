#include "include/speedsimulator.h"
#include <QDebug>

SpeedSimulator::SpeedSimulator(QObject *parent)
    : QObject{parent}
    , speed(0)
    , distanceCovered(0)
    , elapsedTime(0)
    , totalDistance(2.0)
    , distanceToNextInstruction(0)
    , timer(new QTimer(this))
    , isPaused(true)
{
    connect(timer, &QTimer::timeout, this, &SpeedSimulator::onTimeout);
}

double SpeedSimulator::getSpeed() const
{
    return speed;
}

void SpeedSimulator::setSpeed(double newSpeed)
{
    if (speed != newSpeed) {
        speed = newSpeed;
        emit speedUpdated(speed);
    }
}

double SpeedSimulator::getDistanceCovered() const
{
    return distanceCovered;
}

void SpeedSimulator::setDistanceCovered(double newDistanceCovered)
{
    if (distanceCovered != newDistanceCovered) {
        distanceCovered = newDistanceCovered;
        emit distanceUpdated(distanceCovered);
    }
}

double SpeedSimulator::getTotalDistance() const
{
    return totalDistance;
}

void SpeedSimulator::setTotalDistance(double distance)
{
    if (totalDistance != distance) {
        totalDistance = distance;
        emit totalDistanceUpdated(totalDistance);
    }
}

void SpeedSimulator::setDistanceToNextInstruction(double distance)
{
    distanceToNextInstruction = distance;
    updatePhase();
    if (isPaused) {
        emit accelerationStateChanged(false);
    }
}

void SpeedSimulator::startSimulation()
{
    if (timer->isActive()) {
        return;
    }
    isPaused = false;

    if (!timer->isActive()) {
        qDebug() << "Start";
        speed = 0;
        elapsedTime = 0;
        currentPhase = PHASE_1;
        timer->start(static_cast<int>(dt * 1000)); // Convert dt to ms
    } else {
        qDebug() << "Resume";
    }
}

void SpeedSimulator::stopSimulation()
{
    if (timer->isActive()) {
        timer->stop();
        qDebug()<< "Stopped";
    }
}

void SpeedSimulator::toggleSimulation()
{
    if (isPaused) {
        startSimulation();
    } else {
        isPaused = true;
        qDebug() << "Pause";
    }
}

void SpeedSimulator::onTimeout()
{
    if (isPaused) {
        if (speed > 0) {
            speed -= 1; // Decelerate
            if (speed < 0) {
                speed = 0;
            }
            emit speedUpdated(speed);
            emit accelerationStateChanged(false);
        } else {
            stopSimulation();
        }
        return;
    }

    calculateSpeedAdjustment();
    elapsedTime += dt;
    distanceCovered += speed * (dt / 3600.0);

    if (distanceCovered >= totalDistance) {
        stopSimulation();
        speed = 0;
        emit speedUpdated(speed);
        emit simulationFinished();
    }
}

void SpeedSimulator::calculateSpeedAdjustment()
{
    double targetSpeedMin, targetSpeedMax;

    switch (currentPhase) {
    case PHASE_1:
        targetSpeedMin = 20;
        targetSpeedMax = 30;
        break;
    case PHASE_2:
        targetSpeedMin = 30;
        targetSpeedMax = 60;
        break;
    case PHASE_3:
        targetSpeedMin = 60;
        targetSpeedMax = 120;
        break;
    case PHASE_4:
        targetSpeedMin = 120;
        targetSpeedMax = 150;
        break;
    case DECEL_TO_0:
        targetSpeedMin = 0;
        targetSpeedMax = 0;
        break;
    }

    if (currentPhase != DECEL_TO_0) {
        if (speed < targetSpeedMin) {
            speed += 1; // Accelerate
        } else if (speed > targetSpeedMax) {
            speed -= 1; // Decelerate
        } else {
            // Fluctuate within the range
            speed += (std::rand() % 3 - 1);
        }
    } else {
        // Decelerate to 0
        if (speed > 0) {
            speed -= 2;
            if (speed < 0) {
                speed = 0;
            }
            emit accelerationStateChanged(false);
        }
    }

    emit speedUpdated(speed);

    if (distanceCovered >= 0.98 * totalDistance) { // 98 % of total dist
        startDecelerationToZero();
    }
}

void SpeedSimulator::updatePhase()
{
    if (distanceToNextInstruction < 150) {
        currentPhase = PHASE_1;
        emit accelerationStateChanged(true);
    } else if (distanceToNextInstruction < 500) {
        currentPhase = PHASE_2;
        emit accelerationStateChanged(true);
    } else if (distanceToNextInstruction < 1000) {
        currentPhase = PHASE_3;
        emit accelerationStateChanged(true);
    } else if (distanceToNextInstruction >= 1000) {
        currentPhase = PHASE_4;
        emit accelerationStateChanged(true);
    }

    // Drop speed gradually at 75% of the distance to next instruction
    double phaseThreshold = 0.75 * distanceToNextInstruction;
    if (distanceCovered >= phaseThreshold) {
        dropSpeedBackward();
        emit accelerationStateChanged(false);
    }
}

void SpeedSimulator::dropSpeedBackward()
{
    while (currentPhase != PHASE_1) {
        switch (currentPhase) {
        case PHASE_4:
            if (speed > 120) {
                currentPhase = PHASE_3;
            }
            break;
        case PHASE_3:
            if (speed > 60) {
                currentPhase = PHASE_2;
            }
            break;
        case PHASE_2:
            if (speed > 30) {
                currentPhase = PHASE_1;
            }
            break;
        default:
            break;
        }
        calculateSpeedAdjustment();
        emit accelerationStateChanged(true);
    }
}

void SpeedSimulator::startDecelerationToZero()
{
    while (currentPhase != DECEL_TO_0) {
        switch (currentPhase) {
        case PHASE_4:
            currentPhase = PHASE_3;
            break;
        case PHASE_3:
            currentPhase = PHASE_2;
            break;
        case PHASE_2:
            currentPhase = PHASE_1;
            break;
        case PHASE_1:
            currentPhase = DECEL_TO_0;
            break;
        default:
            break;
        }
        calculateSpeedAdjustment();
        emit accelerationStateChanged(false);
    }
}

bool SpeedSimulator::accelerationState() const
{
    return m_accelerationState;
}

void SpeedSimulator::setAccelerationState(bool newAccelerationState)
{
    m_accelerationState = newAccelerationState;
    emit accelerationStateChanged(false);
}
