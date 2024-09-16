import QtQuick 2.15
import QtQuick.Controls 2.15
import QtLocation 5.15
import QtPositioning 5.15
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects
import ICMain

Item {

    id: navigationModule
    property var currentStartPoint: QtPositioning.coordinate(
                                        mainController.navigationController.startPointLatitude,
                                        mainController.navigationController.startPointLongitude)
    property var endPoint: QtPositioning.coordinate(
                               mainController.navigationController.endPointLatitude,
                               mainController.navigationController.endPointLongitude)

    property real radiusForTransparentRect: 60
    property real zoomLevelOfMap: 18
    property real tiltOfMap: 60
    property real widthAndHeightOfImage: 50
    property real widthOfRectOnMap: 350
    property real heightOfRectOnMap: 30
    property real radiusOfRectOnMap: 20
    property real currentSegmentIndex: 0
    property real currentCoordinateIndex: 0
    property var routeSegments: []
    property real totalRouteDistance: 0
    property real remainingDistance: 0
    property string currentManeuver: "Continue"
    property bool maneuverPassed: false
    property real islivespeed: mainController.vehicleMetrics.speed
    property string directionImageSource: mainController.navigationController.directionImage

    Connections {
        target: mainController.navigationController
        function onDirectionImageChanged() {
            directionImageSource = mainController.navigationController.directionImage
        }
    }

    Rectangle {
        id: transparentRect
        width: parent.width
        height: parent.height
        radius: radiusForTransparentRect
        smooth: true
        visible: true
    }

    Rectangle {
        id: rectMap
        width: transparentRect.width
        height: transparentRect.height
        radius: transparentRect.radius
        anchors.centerIn: parent
        border.color: Styles.appTranslucentColor
        layer.enabled: true
        layer.effect: OpacityMask {
            maskSource: transparentRect
            source: rectMap
        }

        Plugin {
            id: mapPlugin
            name: "osm"
            PluginParameter {
                name: "osm.mapping.custom.host"
                value: "https://tile.openstreetmap.org/"
            }
        }

        RouteQuery {
            id: routeQuery
            waypoints: [currentStartPoint, endPoint]
        }

        RouteModel {
            id: routeModel
            plugin: mapPlugin
            query: routeQuery
            autoUpdate: true

            onStatusChanged: {

                if (status === RouteModel.Ready) {
                    var route = routeModel.get(0)
                    var totalDistance = route.distance
                    totalRouteDistance = totalDistance
                    mainController.simulationController.speedSimulator.setTotalDistance(
                                totalRouteDistance / 1000)
                    remainingDistance = totalDistance
                    distanceText.text = "Total Distance: " + (remainingDistance / 1000).toFixed(
                                2) + " km"
                    routeDetailsModel.clear()
                    startMarkerMovement(route.segments)
                }
            }
        }

        ListModel {
            id: routeDetailsModel
        }

        ListModel {
            id: routeSegmentsModel
        }

        Map {
            id: mapView
            anchors.fill: parent
            plugin: mapPlugin
            center: startPointMarker.coordinate
            copyrightsVisible: false
            activeMapType: mapView.supportedMapTypes[mapView.supportedMapTypes.length - 1]
            zoomLevel: zoomLevelOfMap
            tilt: tiltOfMap
            bearing: 0

            PinchHandler {
                target: mapView
                onActiveChanged: if (active) {
                                     mapView.startCentroid = mapView.toCoordinate(
                                                 pinch.centroid.position, false)
                                 }
                onScaleChanged: delta => {
                                    mapView.zoomLevel += Math.log2(delta)
                                    mapView.alignCoordinateToPoint(
                                        mapView.startCentroid,
                                        pinch.centroid.position)
                                }
                grabPermissions: PointerHandler.TakeOverForbidden
            }

            WheelHandler {
                target: mapView
                acceptedDevices: Qt.platform.pluginName === "cocoa"
                                 || Qt.platform.pluginName
                                 === "wayland" ? PointerDevice.Mouse
                                                 | PointerDevice.TouchPad : PointerDevice.Mouse
                rotationScale: 1 / 120
                property: "zoomLevel"
            }

            DragHandler {
                target: mapView
                onTranslationChanged: delta => mapView.pan(-delta.x, -delta.y)
            }

            MapItemView {
                model: routeSegmentsModel
                delegate: MapPolyline {
                    path: [QtPositioning.coordinate(
                            model.segmentStartLat,
                            model.segmentStartLng), QtPositioning.coordinate(
                            model.segmentEndLat, model.segmentEndLng)]
                    line.width: 7
                    line.color: model.isTraversed ? Styles.appMenuTextColor : Styles.navigationRouteColor
                }
            }

            MapQuickItem {
                id: startPointMarker
                coordinate: currentStartPoint
                anchorPoint.x: carImg.width / 2
                anchorPoint.y: carImg.height
                sourceItem: Image {
                    id: carImg
                    source: "assets/Image/Car.png"
                    width: widthAndHeightOfImage
                    height: widthAndHeightOfImage
                }
            }

            MapQuickItem {
                id: endPointMarker
                coordinate: endPoint
                anchorPoint.x: endPointImg.width / 2
                anchorPoint.y: endPointImg.height
                sourceItem: Image {
                    id: endPointImg
                    source: "assets/Image/Pin.png"
                    width: widthAndHeightOfImage
                    height: widthAndHeightOfImage
                }
            }

            Component.onCompleted: {
                routeModel.update()
            }

            Rectangle {
                id: directionRect
                width: widthOfRectOnMap
                height: heightOfRectOnMap * 2
                radius: radiusOfRectOnMap
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

                anchors.horizontalCenter: parent.horizontalCenter

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
                            source: directionImageSource
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
                                pixelSize: Math.min(parent.width,
                                                    parent.height) * 0.24
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

            Rectangle {
                id: maneuverRect
                width: widthOfRectOnMap
                height: heightOfRectOnMap
                radius: radiusOfRectOnMap
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
                    bottom: parent.bottom
                }

                RowLayout {
                    spacing: 20
                    anchors.fill: parent
                    anchors {
                        centerIn: parent
                        leftMargin: 10
                        rightMargin: 10
                    }
                    Rectangle {
                        id: distanceTextRect
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        color: Styles.appTranslucentColor
                        Text {
                            id: distanceText
                            color: Styles.appTextColor
                            anchors {
                                fill: parent
                            }
                            font {
                                family: Styles.txtFontFamily
                                pixelSize: Math.min(parent.width,
                                                    parent.height) * 0.47
                                bold: true
                            }
                            text: "Calculating distance..."
                            wrapMode: Text.WordWrap
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                    }
                    Rectangle {
                        id: navImgRect
                        Layout.preferredWidth: 33
                        Layout.preferredHeight: parent.height
                        color: Styles.appTranslucentColor
                        Image {
                            id: navImg
                            source: "assets/Image/NavIcon.png"
                            anchors {
                                fill: parent
                                centerIn: parent
                            }
                            fillMode: Image.PreserveAspectFit
                        }
                    }
                    Rectangle {
                        id: distanceTimeRect
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        color: Styles.appTranslucentColor
                        Text {
                            id: distanceTime
                            color: Styles.appTextColor
                            anchors {
                                fill: parent
                            }
                            font {
                                family: Styles.txtFontFamily
                                pixelSize: Math.min(parent.width,
                                                    parent.height) * 0.47
                                bold: true
                            }
                            text: "Calculating Time..."
                            wrapMode: Text.WordWrap
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                    }
                }
            }
        }
    }

    Timer {
        id: animationTimer
        interval: islivespeed <= 25 ? 800 : 420
        repeat: true
        running: islivespeed == 0 ? false : true
        onTriggered: updateMarkerPosition()
    }

    PropertyAnimation {
        id: bearingAnimation
        target: mapView
        property: "bearing"
        duration: 200
        easing.type: Easing.Linear
    }

    PropertyAnimation {
        id: coordinateAnimation
        target: startPointMarker
        property: "coordinate"
        duration: animationTimer.interval === 800 ? 740 : 390
        easing.type: Easing.Linear
    }

    function startMarkerMovement(segments) {
        currentSegmentIndex = 0
        currentCoordinateIndex = 0
        routeSegments = segments
        routeSegmentsModel.clear()

        for (var i = 0; i < segments.length; i++) {

            for (var j = 0; j < segments[i].path.length - 1; j++) {

                var distanceToNextInstruction = j < segments[i].path.length
                        - 1 ? segments[i].path[j + 1].distanceTo(
                                  segments[i].path[j]) : 0
                routeSegmentsModel.append({
                                              "segmentStartLat": segments[i].path[j].latitude,
                                              "segmentStartLng": segments[i].path[j].longitude,
                                              "segmentEndLat": segments[i].path[j + 1].latitude,
                                              "segmentEndLng": segments[i].path[j + 1].longitude,
                                              "isTraversed": false,
                                              "maneuver": segments[i].maneuver
                                          })
            }
        }

        updateManeuverDetails()
        animationTimer.start()
    }

    function getModelIndexForCoordinates(segmentIndex, coordinateIndex) {
        var index = 0

        for (var i = 0; i < segmentIndex; i++) {
            index += routeSegments[i].path.length - 1
        }
        return index + coordinateIndex - 1
    }

    function updateMarkerPosition() {
        if (!mainController.vehicleMetrics.isLaunchingAnimation) {
            if (currentSegmentIndex < routeSegments.length) {
                var segment = routeSegments[currentSegmentIndex]
                var path = segment.path

                if (currentCoordinateIndex < path.length - 1) {
                    currentCoordinateIndex++
                    var newCoordinate = path[currentCoordinateIndex]
                    var previousCoordinate = path[currentCoordinateIndex - 1]

                    // Update coordinate animation
                    coordinateAnimation.from = previousCoordinate
                    coordinateAnimation.to = newCoordinate
                    coordinateAnimation.start()

                    // Update bearing animation
                    var newBearing = calculateBearing(previousCoordinate,
                                                      newCoordinate)
                    bearingAnimation.from = mapView.bearing
                    bearingAnimation.to = newBearing
                    bearingAnimation.start()

                    var modelIndex = getModelIndexForCoordinates(
                                currentSegmentIndex, currentCoordinateIndex)

                    if (modelIndex >= 0) {
                        routeSegmentsModel.setProperty(modelIndex,
                                                       "isTraversed", true)
                    }

                    // Calculate remaining distance
                    var distanceChange = Math.abs(previousCoordinate.distanceTo(
                                                      newCoordinate))
                    remainingDistance -= distanceChange
                    mainController.simulationController.speedSimulator.setDistanceCovered(
                                (totalRouteDistance / 1000) - (remainingDistance / 1000))
                    distanceText.text = "Distance: " + Math.abs(
                                remainingDistance / 1000).toFixed(2) + " km"

                    if (segment.maneuver
                            || currentCoordinateIndex === segment.maneuver.position) {

                        maneuverPassed = true
                    }

                    // Calculate estimated time
                    var speedKmPerMin = 0.46
                    var timeMinutes = Math.abs(
                                remainingDistance / (speedKmPerMin * 1000))
                    mainController.vehicleMetrics.setTravelTime(
                                (totalRouteDistance / (speedKmPerMin * 1000) - timeMinutes))
                    if (timeMinutes < 60) {
                        var minutes = Math.floor(timeMinutes)
                        var seconds = Math.floor((timeMinutes - minutes) * 60)
                        distanceTime.text = "In: " + minutes + " min " + seconds + " sec"
                    } else {
                        var hours = Math.floor(timeMinutes / 60)
                        minutes = Math.floor(timeMinutes % 60)
                        seconds = Math.floor((timeMinutes % 1) * 60)
                        distanceTime.text = "In: " + hours + " hr " + minutes
                                + " min " + seconds + " sec"
                    }

                    updateManeuverDetails()
                } else {
                    currentSegmentIndex++
                    currentCoordinateIndex = 0
                    maneuverPassed = false
                    updateManeuverDetails()
                }
            } else {
                animationTimer.stop()
                mainController.navigationController.setManuverInstruction(
                            "Arrived at destination!")
            }
        }
    }
    function updateManeuverDetails() {

        if (currentSegmentIndex < routeSegments.length) {
            var segment = routeSegments[currentSegmentIndex]
            var distanceToNextInstruction = calculateDistanceToNextInstruction()

            if (segment.maneuver) {

                if (maneuverPassed) {

                    if (currentSegmentIndex + 1 < routeSegments.length) {

                        var nextSegment = routeSegments[currentSegmentIndex + 1]

                        if (nextSegment.maneuver) {

                            mainController.navigationController.setManuverInstruction(
                                        nextSegment.maneuver.instructionText + " in "
                                        + distanceToNextInstruction.value.toFixed(
                                            2) + " " + distanceToNextInstruction.unit)

                            if (distanceToNextInstruction.value <= 150) {

                                mainController.navigationController.setManuverEnum(
                                            nextSegment.maneuver.direction)
                                mainController.warningIndicatorController.setDirectionEnum(
                                            nextSegment.maneuver.direction)
                                mainController.navigationController.setUpdateImage(
                                            "ManeuverEnum")
                            } else {

                                directionImageSource = "assets/Image/Straight.png"
                                mainController.navigationController.setManuverInstruction(
                                            "Now continue straight and "
                                            + nextSegment.maneuver.instructionText + " in "
                                            + distanceToNextInstruction.value.toFixed(
                                                2) + " " + distanceToNextInstruction.unit)
                                mainController.warningIndicatorController.setDirectionEnum(
                                            0)
                                mainController.navigationController.setUpdateImage(
                                            "Straight")
                            }
                        }
                    } else {
                        mainController.navigationController.setManuverInstruction(
                                    "Continue straight. Next instruction in "
                                    + distanceToNextInstruction.value.toFixed(
                                        2) + " " + distanceToNextInstruction.unit)
                        directionImageSource = "assets/Image/Straight.png"
                        mainController.navigationController.setUpdateImage(
                                    "Straight")
                    }
                } else {

                    currentManeuver = segment.maneuver.instructionText
                    mainController.navigationController.setManuverInstruction(
                                currentManeuver + " Next instruction in "
                                + distanceToNextInstruction.value.toFixed(
                                    2) + " " + distanceToNextInstruction.unit)
                    mainController.navigationController.setManuverEnum(
                                segment.maneuver.direction)
                    mainController.navigationController.setUpdateImage(
                                "ManeuverEnum")
                }
            }
        } else {
            mainController.navigationController.setManuverInstruction(
                        "Arrived at destination!")
            directionImageSource = "assets/Image/arrivedFlag.png"
            mainController.warningIndicatorController.setDirectionEnum(0)
            mainController.navigationController.setUpdateImage("Arrived")
        }
    }

    function calculateDistanceToNextInstruction() {

        var distanceToNextInstruction = 0
        var segment = routeSegments[currentSegmentIndex]

        for (var i = currentCoordinateIndex; i < segment.path.length - 1; i++) {
            distanceToNextInstruction += segment.path[i].distanceTo(
                        segment.path[i + 1])
        }
        mainController.simulationController.speedSimulator.setDistanceToNextInstruction(
                    distanceToNextInstruction)
        return {
            "value": distanceToNextInstruction,
            "unit": "meters"
        }
    }

    function calculateBearing(start, end) {
        var startLat = start.latitude * Math.PI / 180.0
        var startLng = start.longitude * Math.PI / 180.0
        var endLat = end.latitude * Math.PI / 180.0
        var endLng = end.longitude * Math.PI / 180.0

        var dLng = endLng - startLng

        var y = Math.sin(dLng) * Math.cos(endLat)
        var x = Math.cos(startLat) * Math.sin(endLat) - Math.sin(
                    startLat) * Math.cos(endLat) * Math.cos(dLng)

        var bearing = Math.atan2(y, x)
        bearing = bearing * 180.0 / Math.PI

        return (bearing + 360.0) % 360.0
    }
}
