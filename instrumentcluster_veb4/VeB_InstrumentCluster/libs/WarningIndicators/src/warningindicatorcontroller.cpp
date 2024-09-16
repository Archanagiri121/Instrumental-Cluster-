#include "include/warningindicatorcontroller.h"
#include "qdebug.h"

WarningIndicatorController::WarningIndicatorController(QObject *parent)
    : QObject{parent}
    , m_timer(new QTimer(this))
    , m_seatbeltIndicatorIsActivated(true)
    , m_doorIndicatorIsActivated(true)
    , m_handbrakeIndicatorIsActivated(true)
    , m_gearState(0)
{
    connect(m_timer, &QTimer::timeout, this, &WarningIndicatorController::updateIndicators);
    qDebug(__FUNCTION__);
}

WarningIndicatorController::~WarningIndicatorController()
{
    qDebug() << __FUNCTION__ << "WarningIndicatorController destroyed.";
}

bool WarningIndicatorController::leftIndicatorIsActivated() const
{
    return m_leftIndicatorIsActivated;
}

void WarningIndicatorController::setLeftIndicatorIsActivated(bool newLeftIndicatorIsActivated)
{
    m_leftIndicatorIsActivated = newLeftIndicatorIsActivated;
    emit leftIndicatorIsActivatedChanged();
}

bool WarningIndicatorController::isRightIndicatorIsActivated() const
{
    return m_rightIndicatorIsActivated;
}

void WarningIndicatorController::setRightIndicatorIsActivated(bool newRightIndicatorIsActivated)
{
    m_rightIndicatorIsActivated = newRightIndicatorIsActivated;
    emit rightIndicatorIsActivatedChanged();
}

bool WarningIndicatorController::isHandbrakeIndicatorIsActivated() const
{
    return m_handbrakeIndicatorIsActivated;
}

void WarningIndicatorController::setHandbrakeIndicatorIsActivated(
    bool newHandbrakeIndicatorIsActivated)
{
    m_handbrakeIndicatorIsActivated = newHandbrakeIndicatorIsActivated;
    emit handbrakeIndicatorIsActivatedChanged();
}

bool WarningIndicatorController::isDoorIndicatorIsActivated() const
{
    return m_doorIndicatorIsActivated;
}

void WarningIndicatorController::setDoorIndicatorIsActivated(bool newDoorIndicatorIsActivated)
{
    m_doorIndicatorIsActivated = newDoorIndicatorIsActivated;
    emit doorIndicatorIsActivatedChanged();
}

bool WarningIndicatorController::isSeatbeltIndicatorIsActivated() const
{
    return m_seatbeltIndicatorIsActivated;
}

void WarningIndicatorController::setSeatbeltIndicatorIsActivated(bool newSeatbeltIndicatorIsActivated)
{
    m_seatbeltIndicatorIsActivated = newSeatbeltIndicatorIsActivated;
    emit seatbeltIndicatorIsActivatedChanged();
}

bool WarningIndicatorController::isHeadlightIndicatorIsActivated() const
{
    return m_headlightIndicatorIsActivated;
}

void WarningIndicatorController::setHeadlightIndicatorIsActivated(
    bool newHeadlightIndicatorIsActivated)
{
    m_headlightIndicatorIsActivated = newHeadlightIndicatorIsActivated;
    emit headlightIndicatorIsActivatedChanged();
}

int WarningIndicatorController::headlightState() const
{
    return m_headlightState;
}

void WarningIndicatorController::setHeadlightState(int newHeadlightState)
{
    m_headlightState = newHeadlightState;
    emit headlightStateChanged();
}

int WarningIndicatorController::gearState() const
{
    return m_gearState;
}

void WarningIndicatorController::setGearState(int newGearState)
{
    m_gearState = newGearState;
    emit gearStateChanged();
}

void WarningIndicatorController::launchingAnimation()
{
    m_updateCount = 0;
    m_timer->start(2000);
}

void WarningIndicatorController::updateIndicators()
{
    switch (m_updateCount)
    {
    case 0:
        setDoorIndicatorIsActivated(false);
        break;
    case 1:
        setSeatbeltIndicatorIsActivated(false);
        break;
    case 2:
        setHandbrakeIndicatorIsActivated(false);
        break;
    case 3:
        setGearState(2);
        break;
    default:
        break;
    }

    m_updateCount++;

    if (m_updateCount >= 4) {
        m_timer->stop();
        emit launchAnimationFinished();
    }
}

int WarningIndicatorController::directionEnum() const
{
    return m_directionEnum;
}

void WarningIndicatorController::setDirectionEnum(int newDirectionEnum)
{
    m_directionEnum = newDirectionEnum;
    if (m_warningRunning == true) {
        switch (newDirectionEnum) {
        case 0:
        case 1:
            setLeftIndicatorIsActivated(false);
            setRightIndicatorIsActivated(false);
            break;
        case 2:
        case 3:
        case 4:
        case 5:
            setRightIndicatorIsActivated(true);
            setLeftIndicatorIsActivated(false);
            break;
        case 6:
            setRightIndicatorIsActivated(false);
            setLeftIndicatorIsActivated(true);
            break;
        case 7:
            setLeftIndicatorIsActivated(false);
            setRightIndicatorIsActivated(true);
            break;
        case 8:
        case 9:
        case 10:
        case 11:
            setLeftIndicatorIsActivated(true);
            setRightIndicatorIsActivated(false);
            break;
        default:
            setLeftIndicatorIsActivated(false);
            setRightIndicatorIsActivated(false);
            break;
        }
    }
    emit directionEnumChanged();
}

bool WarningIndicatorController::warningRunning() const
{
    return m_warningRunning;
}

void WarningIndicatorController::setWarningRunning(bool newWarningRunning)
{
    m_warningRunning = newWarningRunning;
    emit warningRunningChanged();
}
