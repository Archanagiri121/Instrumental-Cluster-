import QtQuick 2.15
import QtQuick.Controls
import ICMain

Rectangle {
    id: rectGearIndicator
    width: Math.min(parent.width, parent.height)
    height: width
    color: Styles.appTranslucentColor
    border.color: Styles.appTranslucentColor
    border.width: 3.5
    radius: rectGearIndicator.width / 2
    anchors.centerIn: parent

    Tumbler {
        anchors.fill: parent
        id: tumbler
        visibleItemCount: 1
        model: ["P", "N", "D", "R"]

        onCurrentIndexChanged: {
            updateTumblerIndex(tumbler.currentIndex)
        }
        delegate: Text {
            id: txtGearIndicator
            text: modelData
            color: Styles.appTextColor
            font.bold: true
            font.pixelSize: rectGearIndicator.width * 0.6
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.family: Styles.txtFontFamily
            opacity: 1.0 - Math.abs(
                         Tumbler.displacement) / (Tumbler.tumbler.visibleItemCount / 4)
        }
        currentIndex: mainController.warningIndicatorController.gearState

        Canvas {
            id: canvasRotatingArc
            anchors.fill: parent
            property string arcColor: Styles.canvasArcLow
            property string arcColor2: Styles.appTranslucentColor

            RotationAnimator {
                id: rotationAnimatorArc
                target: canvasRotatingArc
                from: 0
                to: 360
                duration: 3000
                running: true
                loops: Animation.Infinite
            }
            RotationAnimator {
                id: rotationAnimatorArcReverse
                target: canvasRotatingArc
                from: 360
                to: 0
                duration: 3000
                running: true
                loops: Animation.Infinite
            }

            onPaint: {
                var ctx = getContext("2d")
                ctx.reset()
                var centreX = width / 2
                var centreY = height / 2
                var thickness = 3.5
                var radius = rectGearIndicator.radius - 1
                var innerRadius = radius - thickness - 1
                var startAngle = Math.PI * 0
                var endAngle = Math.PI * 3
                var arcStartAngle = startAngle
                var arcEndAngle = endAngle
                var gradient = ctx.createLinearGradient(0.25 * width, 0,
                                                        0.75 * width, height)
                gradient.addColorStop(0.25, arcColor)
                gradient.addColorStop(1, arcColor2)
                ctx.beginPath()
                ctx.strokeStyle = gradient
                ctx.lineWidth = thickness - 1.1
                ctx.arc(centreX, centreY, radius, startAngle, endAngle, false)
                ctx.stroke()
            }
        }
    }

    function updateTumblerIndex(index) {
        switch (index) {
        case 0:
            canvasRotatingArc.arcColor = Styles.canvasArcLow
            canvasRotatingArc.arcColor2 = Styles.appTranslucentColor
            rotationAnimatorArc.running = true
            rotationAnimatorArcReverse.running = false
            break
        case 1:
            canvasRotatingArc.arcColor = Styles.appTextColor
            canvasRotatingArc.arcColor2 = Styles.appTextColor
            rotationAnimatorArc.running = false
            rotationAnimatorArcReverse.running = false
            break
        case 2:
            canvasRotatingArc.arcColor = Styles.gearStateMid
            canvasRotatingArc.arcColor2 = Styles.appTranslucentColor
            rotationAnimatorArc.running = true
            rotationAnimatorArcReverse.running = false
            break
        case 3:
            canvasRotatingArc.arcColor = Styles.gearStateHigh
            canvasRotatingArc.arcColor2 = Styles.appTranslucentColor
            rotationAnimatorArc.running = false
            rotationAnimatorArcReverse.running = true
            break
        default:
            canvasRotatingArc.arcColor = Styles.canvasArcLow
            canvasRotatingArc.arcColor2 = Styles.appTranslucentColor
            rotationAnimatorArc.running = true
            rotationAnimatorArcReverse.running = false
        }
        canvasRotatingArc.requestPaint()
    }
}
