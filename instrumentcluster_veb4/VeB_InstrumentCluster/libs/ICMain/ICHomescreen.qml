import QtQuick
import QtQuick.Controls
import QtQuick.Layouts 1.1
import Qt5Compat.GraphicalEffects
import CarModel
import Navigation
import WarningIndicators
import ICMain

Rectangle {
    id: homescreenRect
    radius: 100
    anchors.fill: parent

    property bool keySpacePressed: mainController.vehicleMetrics.spacePressed
    property bool isLaunchingAnimationActive: mainController.vehicleMetrics.isLaunchingAnimation
    property bool updateSpeed: false
    property int upperLowerHeight: 88
    property int middleHeight: 394
    property int upperLowerWidth: 232
    property int middlewidth: 318
    property int marginsVal: 39

    // property bool showPopupIndicator: false //mainController.indicatorPopUp.showPopup
    gradient: Gradient {
        orientation: Gradient.Horizontal
        GradientStop {
            color: Styles.gradientStart
            position: 0.0
        }
        GradientStop {
            color: Styles.gradientMid
            position: 0.30
        }
        GradientStop {
            color: Styles.gradientEnd
            position: 0.45
        }
        GradientStop {
            color: Styles.gradientEnd
            position: 0.55
        }
        GradientStop {
            color: Styles.gradientMid
            position: 0.70
        }
        GradientStop {
            color: Styles.gradientStart
            position: 1.00
        }
    }

    Connections {
        target: mainController.vehicleMetrics
        function onSpeedChanged() {
            if ((!isLaunchingAnimationActive)
                    && mainController.vehicleMetrics.speed >= 135) {
                popupalert.message = "Speed Alert"
                popupalert.image = "assets/images/warnings.png"
                popupalert.open()
            }
        }
        function onBatteryPercentChanged() {
            if ((!isLaunchingAnimationActive)
                    && mainController.vehicleMetrics.batteryPercent <= 10) {
                popupalert.message = "Battery Alert"
                popupalert.image = "assets/images/lowBattery.png"
                popupalert.open()
            }
            if ((!isLaunchingAnimationActive)
                    && mainController.vehicleMetrics.batteryPercent <= 5) {
                popupalert.message = "Battery Charging"
                popupalert.image = "assets/images/charging.png"
                popupalert.duration = 5000
                popupalert.open()
            }
        }
    }

    Connections {
        target: mainController.keyhandler
        function onInfoPopupActive() {
            infoPopup.open()
            autoCloseTimer.start()
        }
    }

    ColumnLayout {
        id: mainColumn
        anchors {
            fill: parent
            leftMargin: marginsVal
            rightMargin: marginsVal
        }

        //upper layouts
        RowLayout {
            id: upperRow
            Layout.preferredHeight: upperLowerHeight
            Layout.fillWidth: true

            Rectangle {
                id: dateTimeIndicator
                color: Styles.appTranslucentColor
                Layout.preferredWidth: upperLowerWidth
                Layout.fillWidth: true
                Layout.fillHeight: true

                DateTime {}

                BoundaryBox {}
            }

            Rectangle {
                id: warningIndicators
                color: Styles.appTranslucentColor
                Layout.preferredWidth: 1106
                Layout.fillWidth: true
                Layout.fillHeight: true

                WarningIndicators {
                    id: warningIndicatorsComponent
                }

                BoundaryBox {}
            }

            Rectangle {
                id: whetherIndicator
                color: Styles.appTranslucentColor
                Layout.preferredWidth: upperLowerWidth
                Layout.fillWidth: true
                Layout.fillHeight: true

                WeatherPage {
                    id: weatherModule
                }

                BoundaryBox {}
            }
        }
        //middle layout
        RowLayout {
            id: middleRow

            Layout.preferredHeight: middleHeight
            Layout.fillWidth: true

            Rectangle {
                id: speedometerIndicator
                color: Styles.appTranslucentColor
                Layout.preferredWidth: middlewidth
                Layout.fillWidth: true
                Layout.fillHeight: true

                SpeedoMeter {
                    id: speedoMeterComponent
                }

                BoundaryBox {}
            }

            Rectangle {
                id: mainMiddleScreen
                color: Styles.appTranslucentColor
                Layout.preferredWidth: 629
                Layout.fillWidth: true
                Layout.fillHeight: true

                IndicatorPopup {
                    id: popupalert
                    anchors.centerIn: mainMiddleScreen
                    visible: false
                    opacity: 0.8

                    onClosed: {
                        if (popupalert.message === "Battery Charging") {
                            mainController.handleBatteryLow()
                        }
                    }
                }

                MenuSection {
                    id: menuSection
                }

                BoundaryBox {}
            }

            Rectangle {
                id: rangeIndicator
                color: Styles.appTranslucentColor
                Layout.preferredWidth: middlewidth
                Layout.fillWidth: true
                Layout.fillHeight: true

                RangeMeter {
                    id: rangeMeterComponent
                }

                BoundaryBox {}
            }
        }
        //lower layout
        RowLayout {
            id: lowerRow

            Layout.preferredHeight: upperLowerHeight
            Layout.fillWidth: true

            Rectangle {
                id: batteryIndicator
                color: Styles.appTranslucentColor
                Layout.preferredWidth: upperLowerWidth
                Layout.fillWidth: true
                Layout.fillHeight: true

                BatteryMeter {
                    id: batteryMeterComponent
                }

                BoundaryBox {}
            }

            Rectangle {
                id: odometerIndicator
                color: Styles.appTranslucentColor
                Layout.preferredWidth: 500
                Layout.fillWidth: true
                Layout.fillHeight: true
                Odometer {
                    id: componentOdometer
                }

                BoundaryBox {}
            }

            Rectangle {
                id: regenIndicator
                color: Styles.appTranslucentColor
                Layout.preferredWidth: upperLowerWidth
                Layout.fillWidth: true
                Layout.fillHeight: true

                RegenMeter {
                    id: regenMeterComponent
                }

                BoundaryBox {}
            }
        }
    }

    Popup {
        id: infoPopup
        width: mainMiddleScreen.width
        height: mainMiddleScreen.height
        anchors.centerIn: parent
        visible: false

        background: Rectangle {
            anchors.fill: parent
            color: Styles.appBgColor
            border.color: Styles.gradientEnd
            border.width: 2
            opacity: 0.9
            radius: 8
            anchors {
                top: parent.top
                topMargin: 5
            }

            ListModel {
                id: instructionModel
                ListElement {
                    event: "Esc"
                    info: "Quit Application"
                }
                ListElement {
                    event: "Space"
                    info: "Speed Accelation"
                }
                ListElement {
                    event: "T"
                    info: "Starts Simulation"
                }
                ListElement {
                    event: "D"
                    info: "Door indicator"
                }
                ListElement {
                    event: "S"
                    info: "Seatbelt indicator"
                }
                ListElement {
                    event: "B"
                    info: "Handbrake indicator"
                }
                ListElement {
                    event: ","
                    info: "Leftturn indicator"
                }
                ListElement {
                    event: "."
                    info: "Rightturn indicator"
                }
                ListElement {
                    event: "G"
                    info: "Gear state (P,N,D,R)"
                }
                ListElement {
                    event: "H"
                    info: "Headlight"
                }
                ListElement {
                    event: "^"
                    info: "Headlight states"
                }
                ListElement {
                    event: "R"
                    info: "Regeneration levels"
                }
                ListElement {
                    event: "<"
                    info: "Switch the Menu Left"
                }
                ListElement {
                    event: ">"
                    info: "Switch the Menu Right"
                }
                ListElement {
                    event: "1"
                    info: "Trip Change"
                }
                ListElement {
                    event: "I"
                    info: "Keys Info"
                }
            }

            GridLayout {
                anchors.fill: parent
                anchors.margins: 10
                columns: 2
                rowSpacing: 10
                columnSpacing: 40

                Repeater {
                    model: instructionModel

                    RowLayout {
                        spacing: 10
                        Rectangle {
                            Layout.preferredWidth: 70
                            Layout.fillHeight: true
                            color: Styles.iCBackgroundcolor
                            border.color: Styles.gradientEnd
                            opacity: 0.8
                            radius: 5
                            Text {
                                text: model.event
                                font.pixelSize: 17
                                color: Styles.appBgColor
                                font.bold: true
                                anchors.centerIn: parent
                                wrapMode: Text.Wrap
                                font.family: Styles.txtFontFamily
                            }
                        }
                        Text {
                            text: model.info
                            color: Styles.appTextColor
                            font.family: Styles.txtFontFamily
                            font.pixelSize: 18
                            wrapMode: Text.WordWrap
                        }
                    }
                }
            }
        }

        Timer {
            id: autoCloseTimer
            interval: 3000
            repeat: false
            onTriggered: {
                infoPopup.close()
            }
        }

        enter: Transition {
            SequentialAnimation {
                PropertyAnimation {
                    target: infoPopup
                    property: "opacity"
                    from: 0
                    to: 1
                    duration: 500
                }
            }
        }
        exit: Transition {
            SequentialAnimation {
                PropertyAnimation {
                    target: infoPopup
                    property: "opacity"
                    from: 1
                    to: 0
                    duration: 500
                }
            }
        }
    }
}
