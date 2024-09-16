#ifndef KEYHANDLER_H
#define KEYHANDLER_H

#include <QDebug>
#include <QGuiApplication>
#include <QKeyEvent>
#include <QKeySequence>
#include <QObject>
#include "../../ICMain/include/menuselection.h"
#include "../../ICMain/include/vehiclemetrics.h"
#include "../../ICSimulation/include/simulationcontroller.h"
#include "../../WarningIndicators/include/warningindicatorcontroller.h"

class Keyhandler : public QObject
{
    Q_OBJECT
public:
    explicit Keyhandler(WarningIndicatorController *warningIndicatorController,
                        VehicleMetrics *vehicleMetrics,
                        MenuSelection *menuSelection,
                        SimulationController *simulationControl,
                        QObject *parent = nullptr);

public slots:
    void handleKeyPress(int key);
    void handleKeyRelease(int key);
    void toggleGearState();

protected:
    bool eventFilter(QObject *watched, QEvent *event) override;

signals:
    void keyEventOccurred(const QString &key);
    void escapeKeyPressed();
    void keySpaceReleased();
    void infoPopupActive();
    void tripIndexChanged();

private:
    WarningIndicatorController *m_warningIndicatorController;
    MenuSelection *m_menuSelection;
    VehicleMetrics *m_vehicleMetrics;
    SimulationController *m_simulationController;

    bool isActive = false;
};

#endif // KEYHANDLER_H
