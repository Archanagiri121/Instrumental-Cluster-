import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import ICMain

RowLayout {
    spacing: 30
    property alias source: icon.source
    property alias textValue: dataText.text

    Image {
        id: icon
        Layout.preferredWidth: 70
        Layout.fillHeight: true
        sourceSize.height: 40
        sourceSize.width: 40
        source: "asset/images/distanceIcon.png"
        fillMode: Image.PreserveAspectFit
        horizontalAlignment: Image.AlignHCenter
        verticalAlignment: Image.AlignVCenter
    }
    Text {
        id: dataText
        text: index
        color: Styles.appTextColor
        font.family: Styles.txtFontFamily
        font.pixelSize: 24
        wrapMode: Text.WordWrap
    }
}
