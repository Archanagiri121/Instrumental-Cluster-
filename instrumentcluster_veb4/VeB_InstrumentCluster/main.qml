import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import ICMain
import CarModel

Window {
    id: ic_main
    width: 1444
    height: 590
    color: Styles.appTranslucentColor
    flags: Qt.FramelessWindowHint
    visible: true

    BoundaryBox {}

    Loader {
        id: pageLoader
        anchors.fill: parent
        sourceComponent: icSplashScreen

        onLoaded: {
            if (pageLoader.item) {
                pageLoader.item.forceActiveFocus()
            }
        }
    }

    Timer {
        interval: 8000
        running: true
        repeat: false
        onTriggered: {
            pageLoader.sourceComponent = icHome
        }
    }

    Component {
        id: icHome

        ICHomescreen {
            id: homeScreeen
        }
    }

    Component {
        id: icSplashScreen

        SplashScreen {
            id: splashScreen
        }
    }
}
