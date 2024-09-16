pragma Singleton

import QtQuick

QtObject {

    //start
    readonly property color appTranslucentColor: "#00000000"
    readonly property color appTextColor: "#FFFFFF"
    readonly property color appMenuTextColor: "#808080"
    readonly property color appBgColor: "#000000"

    readonly property color menuSlideLeft: "#7BD3EA"
    readonly property color menuSlideMid: "#AD88C6"
    readonly property color menuSlideRight: "#A5DD9B"
    readonly property color iCBackgroundcolor: "#b9b9b9"

    // // Background Gradients
    readonly property color gradientStart: "#242A2F"
    readonly property color gradientMid: "#2A393E"
    readonly property color gradientEnd: "#325F62"

    readonly property color regenNotActive: "#12FCC8"
    readonly property color regenActive: "#D0FCF2"

    // // Battery component
    readonly property color batteryMeterBorder: "#232323"
    readonly property color batteryLow: "#06D001"
    readonly property color batteryMid: "#FFC700"

    // // gear state
    readonly property color gearStateMid: "#7CFC00"
    readonly property color gearStateHigh: "#FF3131"

    // // Module Gradients
    readonly property color speedLow: "#E9FF63"
    readonly property color speedMid: "#FF3D00"
    readonly property color speedHigh: "#FF0000" //speed battery spalshscreen
    readonly property color speedStrokeColor: "#0A1425"

    readonly property color rangeSpeedLow: "#0B2533"
    readonly property color rangeSpeedHigh: "#09111E"
    readonly property color rangePathView: "#DD7B7B"

    readonly property color canvasArcLow: "#FFBB00"

    // //Navigation
    readonly property color navigationRouteColor: "#0000FF"

    // // Font Family
    readonly property string txtFontFamily: "Oxanium"
    readonly property string companyNameFont: "Oxanium SemiBold"
}
