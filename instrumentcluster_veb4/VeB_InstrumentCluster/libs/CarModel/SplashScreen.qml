import QtQuick
import QtQuick3D
import QtQuick.Controls
import QtQuick3D.Helpers
import Qt5Compat.GraphicalEffects
import ICMain

Item {
    anchors.fill: parent

    Rectangle {
        id: splashScreen
        width: parent.width
        height: parent.height
        visible: false
        clip: true

        View3D {

            anchors.fill: parent
            environment: SceneEnvironment {
                backgroundMode: SceneEnvironment.Color
                clearColor: Styles.appBgColor
            }

            PerspectiveCamera {
                id: camera
                position: Qt.vector3d(-4.77, 11.67, -54.91)
                eulerRotation: Qt.vector3d(5.07, -174.70, 0)

                ParallelAnimation {
                    id: cameraAnimation
                    running: false
                    PropertyAnimation {
                        id: cameraPositionAnimation
                        target: camera
                        property: "position"
                        from: Qt.vector3d(-4.77, 11.67, -54.91)
                        to: Qt.vector3d(-45.54, 35.78, -36.59)
                        duration: 3000
                    }
                    PropertyAnimation {
                        id: cameraRotationAnimation
                        target: camera
                        property: "eulerRotation"
                        from: Qt.vector3d(5.07, -174.70, 0)
                        to: Qt.vector3d(-21.38, -125.88, 0)
                        duration: 3000
                    }
                }
            }

            Rectangle {
                id: veroltTextRectangle
                anchors.top: parent.top
                anchors.topMargin: 40
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width / 3
                height: parent.height / 4
                visible: true
                color: Styles.appTranslucentColor

                Text {
                    id: veroltTextImage
                    text: "Verolt"
                    color: Styles.speedHigh //"#FF0000"
                    font.pixelSize: parent.width / 3
                    font.family: Styles.companyNameFont // "Oxanium SemiBold"
                    opacity: 0

                    PropertyAnimation {
                        id: veroltTextAnim
                        running: false
                        target: veroltTextImage
                        property: "opacity"
                        from: 0
                        to: 1
                        duration: 600
                    }
                }
            }

            Rectangle {
                id: veroltLogoRect
                anchors.top: veroltTextRectangle.bottom
                anchors.topMargin: 30
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width / 5
                height: parent.width / 5
                visible: true
                color: Styles.appTranslucentColor

                Image {
                    id: veroltLogoImage
                    source: "Image/veroltLogo.png"
                    sourceSize.height: parent.height
                    sourceSize.width: parent.width
                    opacity: 0

                    PropertyAnimation {
                        id: veroltLogoAnim
                        running: false
                        target: veroltLogoImage
                        property: "opacity"
                        from: 0
                        to: 1
                        duration: 1000
                    }
                }
            }

            PointLight {
                id: pointLightRed
                visible: true
                position: Qt.vector3d(600, 300, 2)
                brightness: 0
                color: Styles.speedHigh
                quadraticFade: 6

                PropertyAnimation {
                    id: redLightStartAnim
                    running: false
                    target: pointLightRed
                    property: "brightness"
                    from: 0
                    to: 12
                    duration: 100
                }

                PropertyAnimation {
                    id: redLightMoveAnim
                    running: false
                    target: pointLightRed
                    property: "position.x"
                    from: 800
                    to: -800
                    duration: 2000
                }
                PropertyAnimation {
                    id: redLightEndAnim
                    running: false
                    target: pointLightRed
                    property: "brightness"
                    from: 12
                    to: 0
                    duration: 1000
                }
            }

            SpotLight {
                id: spotLightWhite
                color: Styles.appTextColor
                position: Qt.vector3d(2, 200, 10)
                eulerRotation.x: -88
                visible: true
                brightness: 0
                coneAngle: 20
                innerConeAngle: 10
                constantFade: 1

                PropertyAnimation {
                    id: spotLightStartAnim
                    target: spotLightWhite
                    running: false
                    property: "brightness"
                    from: 0
                    to: 6
                    duration: 500
                }
                PropertyAnimation {
                    id: spotLightMidAnim
                    target: spotLightWhite
                    running: false
                    property: "brightness"
                    from: 6
                    to: 8
                    duration: 3000
                }

                PropertyAnimation {
                    id: spotLightEndAnim
                    target: spotLightWhite
                    running: false
                    property: "brightness"
                    from: 8
                    to: 0
                    duration: 1000
                }
            }

            Model {
                id: base
                source: "#Cube"
                position: Qt.vector3d(0, 0, 0)
                scale: Qt.vector3d(0.8, 0.01, 0.8)
                materials: PrincipledMaterial {
                    baseColorMap: Texture {
                        source: "maps/CarbonBase.png"
                    }
                    roughness: 0.5
                    metalness: 0.9
                }
            }

            Tesla3dModel {
                id: carModel
                scale: Qt.vector3d(0.1, 0.1, 0.1)
                position: Qt.vector3d(0, 8, 0)
                eulerRotation: Qt.vector3d(0, 90, 0)

                SequentialAnimation {
                    id: carRotationAnim
                    running: false
                    NumberAnimation {
                        target: carModel
                        property: "eulerRotation.y"
                        from: 90
                        to: 10
                        duration: 3000
                    }
                }
            }

            SequentialAnimation {
                id: animationSequence
                running: true
                PauseAnimation {
                    duration: 500
                }
                ParallelAnimation {
                    animations: [redLightStartAnim, redLightMoveAnim]
                }
                ParallelAnimation {
                    animations: [veroltTextAnim, spotLightStartAnim]
                }
                PauseAnimation {
                    duration: 500
                }
                ParallelAnimation {
                    animations: [carRotationAnim, cameraAnimation, spotLightMidAnim]
                }
                PauseAnimation {
                    duration: 500
                }
                ParallelAnimation {
                    animations: [spotLightEndAnim, redLightEndAnim, veroltLogoAnim]
                }
            }
        }
    }

    Rectangle {
        id: maskRect
        width: 1444
        height: 590
        radius: 100
        visible: false
    }

    OpacityMask {
        id: opacity
        anchors.fill: splashScreen
        source: splashScreen
        maskSource: maskRect
    }
}
