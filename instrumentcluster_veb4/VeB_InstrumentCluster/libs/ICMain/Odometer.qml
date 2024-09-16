import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: itmOdometer
    anchors.fill: parent
    focus: true
    property real totalDistance: mainController ? mainController.vehicleMetrics.odoMeter : 0 //1111

    Image {
        id: imgLowerCurve
        source: "assets/images/lowerCurve.svg"
        sourceSize.width: parent.width
        sourceSize.height: parent.height
        smooth: true
        anchors.top: parent.top
    }

    Text {
        id: txtTotalDistance
        color: Styles.appTextColor
        font.pixelSize: Math.min(itmOdometer.width, itmOdometer.height) * 0.3
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.family: Styles.txtFontFamily
        anchors {
            horizontalCenter: imgLowerCurve.horizontalCenter
            verticalCenter: imgLowerCurve.verticalCenter
            verticalCenterOffset: 10
        }
        text: itmOdometer.totalDistance.toFixed(0) + " km"

        onTextChanged: {
            if (txtTotalDistance.visible) {
                animation.running = true
            }
        }

        SequentialAnimation on opacity {
            id: animation
            running: false
            NumberAnimation {
                from: 1
                to: 0
                duration: 250
            }
            NumberAnimation {
                from: 0
                to: 1
                duration: 250
            }
        }
    }
}
