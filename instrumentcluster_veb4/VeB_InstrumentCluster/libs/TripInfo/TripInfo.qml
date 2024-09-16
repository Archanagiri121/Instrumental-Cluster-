import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import ICMain

Item {
    focus: true

    Connections {
        target: mainController.keyhandler
        function onTripIndexChanged() {
            if (ls.currentIndex === 0) {
                ls.currentIndex++
            } else {
                ls.currentIndex--
            }
        }
    }

    Rectangle {
        id: elementsRect
        anchors.fill: parent
        color: Styles.appTranslucentColor

        ColumnLayout {
            anchors.fill: parent

            Rectangle {
                id: headerData
                color: Styles.appTranslucentColor
                Layout.fillWidth: true
                Layout.preferredHeight: 80

                ColumnLayout {
                    spacing: 0
                    anchors.fill: parent

                    Text {
                        id: header
                        text: "TRIP INFORMATION"
                        font.pointSize: parent.height * 0.3
                        Layout.alignment: Qt.AlignHCenter
                        color: Styles.gearStateHigh
                        font.bold: true
                        font.family: Styles.txtFontFamily
                    }

                    Rectangle {
                        id: progressBar
                        Layout.preferredWidth: headerData.width * 0.3
                        Layout.preferredHeight: headerData.height * 0.1
                        color: Styles.appMenuTextColor
                        Layout.alignment: Qt.AlignHCenter
                        radius: progressBar.height / 2

                        Rectangle {
                            id: pageStatus
                            width: parent.width / ls.count
                            height: parent.height
                            color: Styles.batteryLow
                            radius: pageStatus.height / 2
                            anchors.left: parent.left
                            anchors.leftMargin: (ls.currentIndex === 0) ? 0 : (pageStatus.width)
                        }
                    }
                }
            }

            Rectangle {
                id: areaCenter
                color: Styles.appTranslucentColor
                Layout.fillWidth: true
                Layout.fillHeight: true
                clip: true

                ListView {
                    id: ls
                    anchors.fill: parent
                    model: mainController.tripInfoController.tripData
                    orientation: ListView.Horizontal
                    delegate: Rectangle {
                        height: areaCenter.height
                        width: areaCenter.width
                        color: Styles.appTranslucentColor

                        GridLayout {
                            anchors.fill: parent
                            anchors.margins: 20
                            anchors {
                                leftMargin: 60
                                rightMargin: 60
                            }
                            columns: 2
                            rowSpacing: 10
                            columnSpacing: 40

                            Text {
                                id: tripDataTxt
                                text: index === 0 ? ("TRIP INFO A") : ("TRIP INFO B")
                                font {
                                    bold: true
                                    pixelSize: 24
                                }
                                font.family: Styles.txtFontFamily
                                color: Styles.appTextColor
                                Layout.columnSpan: 2
                                Layout.alignment: Qt.AlignHCenter
                            }

                            CustomTripElement {
                                source: "asset/images/Trip_Start.png"
                                textValue: fromLocation
                            }

                            CustomTripElement {
                                source: "asset/images/Trip_Destination.png"
                                textValue: toLocation
                            }

                            CustomTripElement {
                                source: "asset/images/Travel_Distance.png"
                                textValue: travelDistance.toFixed(0) + " km"
                            }

                            CustomTripElement {
                                source: "asset/images/Travel_Time.png"
                                textValue: traveltime.toFixed(0) + " Mins"
                            }

                            CustomTripElement {
                                source: "asset/images/Average_Speed.png"
                                textValue: travelavgSpeed.toFixed(0) + " km/h"
                            }
                            CustomTripElement {
                                source: "asset/images/Energy_Consumption.png"
                                textValue: travelDischarge.toFixed(0) + " kWh"
                            }
                        }
                    }
                }
            }

            Rectangle {
                color: Styles.appTranslucentColor
                Layout.fillWidth: true
                Layout.preferredHeight: 40

                Rectangle {
                    anchors.centerIn: parent
                    height: parent.height * 0.8
                    width: parent.width * 0.2
                    radius: 10
                    color: Styles.appMenuTextColor

                    Text {
                        id: btnTxt
                        text: qsTr("Clear")
                        font.bold: true
                        color: Styles.appTextColor
                        anchors.centerIn: parent
                        font.pixelSize: parent.height * 0.7
                        font.family: Styles.txtFontFamily
                    }

                    MouseArea {
                        anchors.fill: parent

                        onClicked: {
                            mainController.tripInfoController.tripData.clearData(
                                        ls.currentIndex)
                        }
                    }
                }
            }
        }
    }
}
