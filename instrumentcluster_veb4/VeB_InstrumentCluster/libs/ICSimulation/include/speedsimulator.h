#ifndef SPEEDSIMULATOR_H
#define SPEEDSIMULATOR_H

#include <QObject>
#include <QTimer>

class SpeedSimulator : public QObject
{
    Q_OBJECT
    Q_PROPERTY(double speed READ getSpeed WRITE setSpeed NOTIFY speedUpdated)
    Q_PROPERTY(double distanceCovered READ getDistanceCovered WRITE setDistanceCovered NOTIFY distanceUpdated)
    Q_PROPERTY(double totalDistance READ getTotalDistance WRITE setTotalDistance NOTIFY totalDistanceUpdated)
    Q_PROPERTY(bool accelerationState READ accelerationState WRITE setAccelerationState NOTIFY
                   accelerationStateChanged)

public:
    explicit SpeedSimulator(QObject *parent = nullptr);
    Q_INVOKABLE void startSimulation();
    Q_INVOKABLE void stopSimulation();
    Q_INVOKABLE void toggleSimulation();

    double getSpeed() const;
    void setSpeed(double newSpeed);

    double getTotalDistance() const;
    double getDistanceCovered() const;

    bool accelerationState() const;
    void setAccelerationState(bool newAccelerationState);

public slots:
    void onTimeout();
    void setDistanceToNextInstruction(double distance);
    void setDistanceCovered(double newDistanceCovered);
    void setTotalDistance(double distance);
    void startDecelerationToZero();
    void dropSpeedBackward();

signals:
    void speedUpdated(double speed);
    void distanceUpdated(double distanceCovered);
    void totalDistanceUpdated(double totalDistance);
    void simulationFinished();
    void accelerationStateChanged(bool isAccelerating);

private:
    void calculateSpeedAdjustment();
    void updatePhase();

    double speed;
    double distanceCovered;
    double totalDistance;
    double elapsedTime;
    double distanceToNextInstruction;

    double acceleration;
    double deceleration;

    QTimer *timer;
    bool isPaused = false;

    enum Phase {
        PHASE_1,
        PHASE_2,
        PHASE_3,
        PHASE_4,
        DECEL_TO_0
    } currentPhase;

    const double dt = 0.1; // Time increment in seconds
    bool m_accelerationState = false;
};

#endif // SPEEDSIMULATOR_H
