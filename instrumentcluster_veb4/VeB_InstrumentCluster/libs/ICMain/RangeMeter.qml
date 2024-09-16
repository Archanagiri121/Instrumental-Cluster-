import QtQuick
import QtQuick.Shapes 1.7
import QtQuick.Controls
import Qt5Compat.GraphicalEffects

Item {
    id: rangeMeter
    anchors.fill: parent
    property bool keyPressed: homescreenRect.keySpacePressed
    property real centerx: rangeMeterRect.width / 2
    property real centery: rangeMeterRect.height / 2
    property real radius: Math.min(rangeMeterRect.width,
                                   rangeMeterRect.height) / 2
    property real colorval: ((pathViewDrive.model) / 200)
    property int speed: mainController.vehicleMetrics.speed
    property real releaseValue: 0
    property int animatTime: 1000
    property int models: 5
    property real startSliderValue: 0
    property real endSliderValue: 200
    property real currentRange: mainController.vehicleMetrics.rangeMeter
    property int previousspeed: 0
    property int currentRegenLevel: mainController.vehicleMetrics.regenLevel
    property real regenPercent: switch (currentRegenLevel) {
                                case 1:
                                    0.5
                                    break
                                case 2:
                                    0.7
                                    break
                                case 3:
                                    1
                                    break
                                }

    Connections {
        target: mainController.vehicleMetrics
        function onSpeedChanged() {
            if (!regenLaunch.running) {
                if (!regenAnimation.running) {
                    if (speed < previousspeed) {
                        releaseValue = previousspeed
                        regenAnimation.start()
                    }
                }
                previousspeed = speed
            }
        }
    }

    Connections {
        target: mainController.keyhandler
        function onKeySpaceReleased() {
            releaseValue = speed
        }
    }

    Component.onCompleted: {
        driveText.x = pathViewDrive.itemAtIndex(
                    pathViewDrive.model - 1).x - (driveText.width + 5)
        driveText.y = pathViewDrive.itemAtIndex(pathViewDrive.model - 1).y + 20
        regenText.x = pathViewRegn.itemAtIndex(pathViewRegn.model - 1).x + 15
        regenText.y = pathViewRegn.itemAtIndex(pathViewRegn.model - 1).y
        driveLaunch.start()
        regenLaunch.start()
    }

    Rectangle {
        id: rangeMeterRect
        anchors.fill: parent
        height: parent.height
        width: parent.width
        focus: true
        color: Styles.appTranslucentColor
        onWidthChanged: {
            driveText.x = pathViewDrive.itemAtIndex(
                        pathViewDrive.model - 1).x - (driveText.width + 5)
            driveText.y = pathViewDrive.itemAtIndex(
                        pathViewDrive.model - 1).y + 20
            regenText.x = pathViewRegn.itemAtIndex(
                        pathViewRegn.model - 1).x + 15
            regenText.y = pathViewRegn.itemAtIndex(pathViewRegn.model - 1).y
        }
        onHeightChanged: {
            driveText.x = pathViewDrive.itemAtIndex(
                        pathViewDrive.model - 1).x - (driveText.width + 5)
            driveText.y = pathViewDrive.itemAtIndex(
                        pathViewDrive.model - 1).y + 20
            regenText.x = pathViewRegn.itemAtIndex(
                        pathViewRegn.model - 1).x + 15
            regenText.y = pathViewRegn.itemAtIndex(pathViewRegn.model - 1).y
        }
        PathView {
            id: pathViewDrive
            anchors.fill: parent
            model: models * 9
            delegate: Rectangle {
                width: 6
                height: 30
                radius: width / 2
                color: index >= 0 ? (index <= ((speed * colorval)) ? Styles.speedHigh : Styles.rangePathView) : Styles.rangePathView
                antialiasing: true
                rotation: 90 + (pathArcDrive.sweepAngle / pathViewDrive.model) * index
            }
            path: Path {
                PathAngleArc {
                    id: pathArcDrive
                    centerX: centerx
                    centerY: centery
                    radiusX: radius / 1.2
                    radiusY: radius / 1.2
                    startAngle: 180
                    sweepAngle: 225
                }
            }
        }
        PathView {
            id: pathViewRegn
            anchors.fill: parent
            model: models * 4
            delegate: Rectangle {
                width: 6
                height: 30
                radius: width / 2
                color: index < (regenSlider.value
                                * (20 / 200)) ? (!keyPressed ? "green" : Styles.appTextColor) : Styles.appTextColor
                antialiasing: true
                rotation: 90 + (pathArcRegn.sweepAngle / pathViewRegn.model) * index
            }
            path: Path {
                PathAngleArc {
                    id: pathArcRegn
                    centerX: centerx
                    centerY: centery
                    radiusX: radius / 1.2
                    radiusY: radius / 1.2
                    startAngle: 180
                    sweepAngle: -95
                }
            }
        }

        Rectangle {
            id: rangeCircle
            width: Math.min(rangeMeterRect.width, rangeMeterRect.height) / 2
            height: width
            radius: width / 2
            anchors {
                horizontalCenter: rangeMeterRect.horizontalCenter
                verticalCenter: rangeMeterRect.verticalCenter
            }
            visible: false
            RadialGradient {
                anchors.fill: parent
                gradient: Gradient {
                    GradientStop {
                        position: 0.0
                        color: Styles.rangeSpeedLow
                    }
                    GradientStop {
                        position: 0.6
                        color: Styles.rangeSpeedHigh
                    }
                }
            }
            antialiasing: true
            Text {
                id: rangeText
                font.pixelSize: parent.width / 3.6
          font.family: Styles.txtFontFamily
                font.weight: Font.Bold
                text: currentRange.toFixed(0) //currentRange.toFixed(0)
                color: Styles.appTextColor
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    verticalCenter: parent.verticalCenter
                }
            }
            Text {
                id: rangeLabel
                text: "RANGE"
                font.pixelSize: Math.min(rangeMeterRect.width,
                                         rangeMeterRect.height) / 18
                font.family: Styles.txtFontFamily
                font.weight: Font.Normal
                font.bold: true
                color: Styles.appTextColor
                anchors {
                    top: parent.top
                    topMargin: parent.height / 5
                    left: parent.left
                    leftMargin: parent.width / 2.9
                }
            }
            Text {
                id: kmLabel
                text: "KM"
                font.pixelSize: Math.min(rangeMeterRect.width,
                                         rangeMeterRect.height) / 14
                font.family: Styles.txtFontFamily
                font.weight: Font.Normal
                font.bold: true
                color: Styles.appTextColor
                anchors {
                    top: parent.top
                    topMargin: parent.height / 2 + 28
                    left: parent.left
                    leftMargin: parent.width / 2.4
                }
            }
        }
        Rectangle {
            id: maskingRectangle
            width: Math.min(rangeMeterRect.width, rangeMeterRect.height) / 2
            height: width
            radius: width / 2
            anchors {
                horizontalCenter: rangeMeterRect.horizontalCenter
                verticalCenter: rangeMeterRect.verticalCenter
            }
            color: Styles.appTextColor
            visible: false
        }
        OpacityMask {
            anchors.fill: rangeCircle
            source: rangeCircle
            maskSource: maskingRectangle
        }
        Text {
            id: regenText
            text: "REGN"
            color: Styles.appTextColor
            font.family: Styles.txtFontFamily
            font.pixelSize: Math.min(rangeMeterRect.width,
                                     rangeMeterRect.height) / 18
        }
        Text {
            id: driveText
            text: "DRIVE"
            color: Styles.appTextColor
            font.family: Styles.txtFontFamily
            font.pixelSize: Math.min(rangeMeterRect.width,
                                     rangeMeterRect.height) / 18
        }

        Slider {
            id: driveSlider
            visible: false
            from: startSliderValue
            value: 0
            to: endSliderValue
            anchors.bottom: parent.bottom
            anchors.left: parent.left
        }
        Slider {
            id: regenSlider
            visible: false
            from: startSliderValue
            value: releaseValue * regenPercent
            to: endSliderValue
        }

        SequentialAnimation {
            id: regenAnimation
            running: false
            NumberAnimation {
                id: regenUpAnim
                target: regenSlider
                property: "value"
                from: startSliderValue
                to: releaseValue * regenPercent
                duration: (animatTime) * 0.3
            }
            NumberAnimation {
                id: regenDownAnim
                target: regenSlider
                property: "value"
                from: releaseValue * regenPercent
                to: startSliderValue
                duration: (animatTime) * 0.7
            }

            onFinished: {
                previousspeed = 0
            }
        }
    }

    SequentialAnimation {
        id: driveLaunch
        running: false
        NumberAnimation {
            target: driveSlider
            property: "value"
            from: startSliderValue
            to: endSliderValue
            duration: (animatTime * 2)
        }
        NumberAnimation {
            target: driveSlider
            property: "value"
            from: endSliderValue
            to: startSliderValue
            duration: (animatTime * 2)
        }
    }

    SequentialAnimation {
        id: regenLaunch
        running: false
        NumberAnimation {
            target: regenSlider
            property: "value"
            from: startSliderValue
            to: endSliderValue
            duration: (animatTime * 2)
        }
        NumberAnimation {
            target: regenSlider
            property: "value"
            from: endSliderValue
            to: startSliderValue
            duration: (animatTime * 2)
        }
    }
}
