import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts
import QtQuick.Shapes 1.15

Item {
    id: batteryMeter
    anchors.fill: parent
    property real battery: mainController.vehicleMetrics.batteryPercent

    Rectangle {
        id: batteryMeterContainer
        anchors.fill: parent
        color: Styles.appTranslucentColor
        anchors.centerIn: parent

        RowLayout {
            id: batteryLayout
            anchors.fill: parent
            spacing: 0

            Rectangle {
                id: carImgRect
                Layout.fillHeight: true
                Layout.preferredWidth: parent.width * 0.3
                Layout.leftMargin: parent.width * 0.1
                color: Styles.appTranslucentColor

                Image {
                    id: carImg
                    source: "assets/images/ecoCarImg.png"
                    anchors.right: parent.right
                    anchors.verticalCenter: parent.verticalCenter
                    sourceSize.width: parent.width * 0.8
                    sourceSize.height: parent.height * 0.8
                }
            }

            Rectangle {
                id: batteryRect
                Layout.fillHeight: true
                Layout.preferredWidth: parent.width * 0.3
                color: Styles.appTranslucentColor

                Rectangle {
                    id: outerRectangle
                    width: parent.width * 0.7
                    height: parent.height * 0.4
                    radius: 8
                    color: Styles.batteryMeterBorder
                    anchors.centerIn: parent
                    clip: true

                    property int padding: 2

                    Rectangle {
                        id: batteryLiquid
                        width: Math.max(
                                   (battery / 100) * (outerRectangle.width - 2
                                                      * outerRectangle.padding),
                                   (outerRectangle.width - 2 * outerRectangle.padding) * 0.07)
                        height: outerRectangle.height - 2 * outerRectangle.padding
                        radius: 7

                        anchors {
                            left: parent.left
                            leftMargin: outerRectangle.padding
                            verticalCenter: parent.verticalCenter
                        }
                        color: battery <= 20 ? Styles.speedHigh : battery >= 60 ? Styles.batteryLow : Styles.batteryMid

                        Behavior on width {
                            NumberAnimation {
                                duration: 300
                            }
                        }
                        Behavior on color {
                            ColorAnimation {
                                duration: 300
                            }
                        }
                        SequentialAnimation on color {
                            id: lowBatteryAnimation
                            loops: Animation.Infinite
                            running: battery <= 20
                            ColorAnimation {
                                from: Styles.speedHigh
                                to: Styles.appTranslucentColor
                                duration: 500
                            }
                            ColorAnimation {
                                from: Styles.appTranslucentColor
                                to: Styles.speedHigh
                                duration: 500
                            }
                        }
                    }
                }

                Rectangle {
                    id: batteryCap
                    width: outerRectangle.height * 0.08
                    height: outerRectangle.height * 0.5
                    radius: height / 2
                    color: Styles.batteryMeterBorder
                    anchors {
                        left: outerRectangle.right
                        verticalCenter: outerRectangle.verticalCenter
                        leftMargin: 4
                    }
                }
            }

            Rectangle {
                id: batteryPercentageRect
                Layout.fillHeight: true
                Layout.preferredWidth: parent.width * 0.32
                color: Styles.appTranslucentColor

                Text {
                    id: batteryPercentageText
                    text: battery.toFixed(0) + "%"
                    Layout.fillWidth: true
                    color: Styles.appTextColor
                    font.family: Styles.txtFontFamily
                    font.bold: true
                    anchors.left: parent.left
                    anchors.leftMargin: 5
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: Math.min(outerRectangle.width,
                                             outerRectangle.height) * 0.5
                }
            }
        }
    }
}
