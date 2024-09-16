import QtQuick
import QtQuick3D
import QtQuick3D.Particles3D
import QtQuick.Controls
import QtQuick.Layouts
import ICMain
import Navigation

Item {

    anchors.bottom: parent.bottom
    anchors.bottomMargin: 40
    property int liveSpeed: mainController.vehicleMetrics.speed
    property real widthOfRectOnMap: parent.width/5.5
    property real heightOfRectOnMap: parent.height*0.08
    property real radiusOfRectOnMap: 20
    property string directionImageSource: mainController.navigationController.directionImage

    Connections {
        target: mainController.navigationController
        function onUpdateImageChanged() {
            if (mainController.navigationController.updateImage === "Straight") {
                directionImageSource = "assets/Image/Straight.png"
            } else if (mainController.navigationController.updateImage === "ManeuverEnum") {
                directionImageSource = mainController.navigationController.directionImage
            } else {
                directionImageSource = "assets/Image/arrivedFlag.png"
            }
        }
    }

    Connections {
        target: mainController.vehicleMetrics
        function onIsLaunchingAnimationChanged() {
            directionRect.visible = true
        }
    }

    Rectangle {
        id: directionRect
        width: widthOfRectOnMap
        height: heightOfRectOnMap * 2
        radius: radiusOfRectOnMap
        visible: false

        gradient: Gradient {
            orientation: Gradient.Horizontal
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
        }
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: parent.top
            topMargin: 40
        }

        RowLayout {
            id: directionImgAndText
            anchors {
                centerIn: parent
                fill: parent
                leftMargin: 10
                rightMargin: 10
            }
            Rectangle {
                id: directionImgRect
                Layout.preferredWidth: 30
                Layout.preferredHeight: parent.height
                color: Styles.appTranslucentColor

                Image {
                    id: directionImg
                    source: "qrc:/qt/qml/Navigation/" + directionImageSource
                    anchors {
                        fill: parent
                        centerIn: parent
                    }
                    fillMode: Image.PreserveAspectFit
                }
            }
            Rectangle {
                id: maneuverTextRect
                Layout.fillWidth: true
                Layout.fillHeight: true
                color: Styles.appTranslucentColor
                Text {
                    id: maneuverText
                    color: Styles.appTextColor
                    text: mainController.navigationController.manuverInstruction
                    font {
                        family: Styles.txtFontFamily
                        pixelSize: Math.min(parent.width, parent.height) * 0.24
                        bold: true
                    }
                    anchors.fill: parent
                    wrapMode: Text.WordWrap
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }
        }
    }

    Image {
        id: firstCarImg
        source: "Image/MainCarImg.png"
        sourceSize.height: parent.height / 2
        sourceSize.width: parent.width / 1.5
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        z: 1
    }

    Image {
        id: secondCarImg
        source: "Image/SecCarImg.png"
        sourceSize.height: parent.height / 6.5
        sourceSize.width: parent.width / 8
        anchors.bottom: firstCarImg.top
        anchors.bottomMargin: parent.height / 10
        anchors.horizontalCenter: parent.horizontalCenter
        z: 1
    }
    Image {
        id: fogImg
        source: "Image/FogOverlay.png"
        sourceSize.height: parent.height / 1.5
        sourceSize.width: parent.width / 1.5
        opacity: 1
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        z: 1
    }

    View3D {
        id: scene3d
        anchors.fill: parent
        environment: SceneEnvironment {
            clearColor: Styles.appTranslucentColor
            backgroundMode: SceneEnvironment.Color
            antialiasingMode: SceneEnvironment.SSAA
        }

        // Camera with a third perspective view
        PerspectiveCamera {
            position: Qt.vector3d(0, 180, 800)
            eulerRotation: Qt.vector3d(-30, 0, 0)
            clipFar: 1000
        }

        // PointLight for basic lighting
        PointLight {
            id: pointLight
            position: Qt.vector3d(200, 200, 400)
            brightness: 50
            ambientColor: Qt.rgba(0.5, 0.3, 0.1, 1.0)
            SequentialAnimation {
                loops: Animation.Infinite
                running: true
                NumberAnimation {
                    target: pointLight
                    property: "brightness"
                    to: 400
                    duration: 2000
                    easing.type: Easing.OutElastic
                }
                NumberAnimation {
                    target: pointLight
                    property: "brightness"
                    to: 50
                    duration: 6000
                    easing.type: Easing.InOutQuad
                }
            }
        }

        // Road model
        Model {
            id: roadModel
            source: "#Cube"
            scale: Qt.vector3d(2.1, 0.1, 500)
            position: Qt.vector3d(0, 0, -24000)
            opacity: 0.9

            materials: PrincipledMaterial {
                baseColorMap: Texture {
                    source: "Image/TransparentRoad.png"
                }
            }

            // to move the road infinitely
            SequentialAnimation {
                loops: Animation.Infinite
                running: liveSpeed == 0 ? false : true

                NumberAnimation {
                    id: numAnim
                    target: roadModel
                    property: "position.z"
                    from: -20000
                    to: 0
                    duration: 50000
                }

                // reset to starting position
                PropertyAction {
                    target: roadModel
                    property: "position.z"
                    value: 0
                }
            }
        }
    }
}
