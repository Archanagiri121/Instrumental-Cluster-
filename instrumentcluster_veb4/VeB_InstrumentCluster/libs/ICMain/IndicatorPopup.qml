import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.1

Popup {
    id: indicatorPopup
    property string message
    property url image
    property int duration: 1000

    background: Rectangle {
        width: 200
        height: 150
        color: Qt.rgba(0.2, 0.2, 0.2, 0.8)
        border.color: Styles.speedHigh
        border.width: 2
        radius: 8
        anchors.centerIn: parent

        Image {
            id: img
            source: indicatorPopup.image
            width: parent.width / .7
            height: parent.height / .7
            anchors.top: parent.top
            anchors.topMargin: 20
            anchors.bottom: alertText.top
            anchors.horizontalCenter: parent.horizontalCenter
            fillMode: Image.PreserveAspectFit
        }
        Text {
            id: alertText
            text: indicatorPopup.message
            color: Styles.appTextColor
            font.pointSize: 18
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 20
            anchors.horizontalCenter: parent.horizontalCenter
            wrapMode: Text.WordWrap
            font.family: Styles.txtFontFamily
        }
    }

    Timer {
        id: autoCloseTimer
        interval: indicatorPopup.duration
        repeat: false
        onTriggered: {
            autoCloseTimer.stop()
            indicatorPopup.close()
        }
    }
    onOpened: {
        autoCloseTimer.start()
    }
}
