#include "include/keyhandler.h"
#include "../../ICMain/include/menuselection.h"
#include "../../ICMain/include/vehiclemetrics.h"
#include "../../ICSimulation/include/simulationcontroller.h"
#include "../../WarningIndicators/include/warningindicatorcontroller.h"

Keyhandler::Keyhandler(WarningIndicatorController *warningIndicatorController,
                       VehicleMetrics *vehicleMetrics,
                       MenuSelection *menuSelection,
                       SimulationController *simulationControl,
                       QObject *parent)
    : QObject(parent)
    , m_warningIndicatorController(warningIndicatorController)
    , m_vehicleMetrics(vehicleMetrics)
    , m_menuSelection(menuSelection)
    , m_simulationController(simulationControl)
{
    qDebug() << "Keys Initialized";
    QGuiApplication::instance()->installEventFilter(this);
}

bool Keyhandler::eventFilter(QObject *watched, QEvent *event)
{
    if (event->type() == QEvent::KeyPress) {
        QKeyEvent *keyEvent = static_cast<QKeyEvent *>(event);
        handleKeyPress(keyEvent->key());
        return true;
    } else if (event->type() == QEvent::KeyRelease) {
        QKeyEvent *keyEvent = static_cast<QKeyEvent *>(event);
        handleKeyRelease(keyEvent->key());
        return true;
    }

    return QObject::eventFilter(watched, event);
}

void Keyhandler::handleKeyPress(int key)
{
    if (!m_vehicleMetrics->isLaunchingAnimation()) {
        switch (key) {
        case Qt::Key_D:
            if (m_warningIndicatorController->isDoorIndicatorIsActivated() == false) {
                m_warningIndicatorController->setDoorIndicatorIsActivated(true);
            } else {
                m_warningIndicatorController->setDoorIndicatorIsActivated(false);
            }
            break;

        case Qt::Key_S:
            if (m_warningIndicatorController->isSeatbeltIndicatorIsActivated() == false) {
                m_warningIndicatorController->setSeatbeltIndicatorIsActivated(true);
            } else {
                m_warningIndicatorController->setSeatbeltIndicatorIsActivated(false);
            }
            break;

        case Qt::Key_B:
            if (m_warningIndicatorController->isHandbrakeIndicatorIsActivated() == false) {
                m_warningIndicatorController->setHandbrakeIndicatorIsActivated(true);
            } else {
                m_warningIndicatorController->setHandbrakeIndicatorIsActivated(false);
            }
            break;

        case Qt::Key_Comma:
            if (m_warningIndicatorController->leftIndicatorIsActivated() == false) {
                m_warningIndicatorController->setLeftIndicatorIsActivated(true);
                m_warningIndicatorController->setRightIndicatorIsActivated(false);
            } else {
                m_warningIndicatorController->setLeftIndicatorIsActivated(false);
            }
            break;

        case Qt::Key_Period:
            if (m_warningIndicatorController->isRightIndicatorIsActivated() == false) {
                m_warningIndicatorController->setRightIndicatorIsActivated(true);
                m_warningIndicatorController->setLeftIndicatorIsActivated(false);
            } else {
                m_warningIndicatorController->setRightIndicatorIsActivated(false);
            }
            break;

        case Qt::Key_H:
            if (m_warningIndicatorController->isHeadlightIndicatorIsActivated() == false) {
                m_warningIndicatorController->setHeadlightIndicatorIsActivated(true);
                if (m_warningIndicatorController->headlightState() == 1) {
                    m_warningIndicatorController->setHeadlightState(0);
                }
            } else {
                m_warningIndicatorController->setHeadlightIndicatorIsActivated(false);
                m_warningIndicatorController->setHeadlightState(0);
            }
            break;

        case Qt::Key_Up:
            if (m_warningIndicatorController->isHeadlightIndicatorIsActivated()) {
                m_warningIndicatorController->setHeadlightState(
                    (m_warningIndicatorController->headlightState() + 1) % 2);
            }
            break;

        case Qt::Key_G:
            toggleGearState();
            break;

        case Qt::Key_Left:
            m_menuSelection->setMenuIndex(
                (m_menuSelection->menuIndex() - 1 + m_menuSelection->repeaterCount())
                % m_menuSelection->repeaterCount());
            break;

        case Qt::Key_Right:
            m_menuSelection->setMenuIndex((m_menuSelection->menuIndex() + 1)
                                          % m_menuSelection->repeaterCount());
            break;

        case Qt::Key_Space:
            if (m_vehicleMetrics->simulationRunning() == false) {
                m_vehicleMetrics->setSpacePressed(true);
            }
            if (m_warningIndicatorController->gearState() != 2) {
                m_warningIndicatorController->setGearState(2);
            }
            break;

        case Qt::Key_Escape:
            emit escapeKeyPressed();
            break;

        case Qt::Key_R:
            m_vehicleMetrics->setRegenLevel((m_vehicleMetrics->regenLevel() % 3) + 1);
            break;

        case Qt::Key_T:
            m_simulationController->speedSimulator()->toggleSimulation();
            if (m_vehicleMetrics->simulationRunning()) {
                m_vehicleMetrics->setSimulationRunning(false);
                m_warningIndicatorController->setWarningRunning(false);
                m_warningIndicatorController->setGearState(0);
            } else {
                m_vehicleMetrics->setSimulationRunning(true);
                m_warningIndicatorController->setWarningRunning(true);
                m_warningIndicatorController->setGearState(2);
            }
            break;
        case Qt::Key_I:
            emit infoPopupActive();
            break;
        case Qt::Key_1:
            emit tripIndexChanged();
            break;

        default:
            NULL;
            break;
        }
    }
}

void Keyhandler::handleKeyRelease(int key)
{
    if (key == Qt::Key_Space) {
        m_vehicleMetrics->setSpacePressed(false);
        emit keySpaceReleased();
    }
}

void Keyhandler::toggleGearState()
{
    int currentGear = m_warningIndicatorController->gearState();
    int nextGear = (currentGear + 1) % 4;
    m_warningIndicatorController->setGearState(nextGear);

    if (nextGear == 3) {
        m_warningIndicatorController->setLeftIndicatorIsActivated(true);
        m_warningIndicatorController->setRightIndicatorIsActivated(true);
    } else {
        m_warningIndicatorController->setLeftIndicatorIsActivated(false);
        m_warningIndicatorController->setRightIndicatorIsActivated(false);
    }
}
