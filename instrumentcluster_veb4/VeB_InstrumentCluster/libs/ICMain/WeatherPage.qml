import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Item {

    anchors.fill: parent

    Rectangle {
        id: weatherIconRect
        width: parent.width
        height: parent.height
        color: Styles.appTranslucentColor

        RowLayout {
            anchors.fill: parent
            id: weatherIconRow
            spacing: 0

            Rectangle {
                id: imgContainer
                Layout.preferredWidth: weatherIconRect.width / 2.5
                Layout.preferredHeight: weatherIconRect.height
                color: Styles.appTranslucentColor

               Image {
                    id: weatherImg
                    anchors {
                        verticalCenter: parent.verticalCenter
                        left: parent.left
                    }
                    sourceSize.width: parent.width * 1
                    sourceSize.height: parent.height * 1
                }
            }

            Rectangle {
                id: textContainer
                Layout.fillWidth: true
                Layout.fillHeight: true
                color: Styles.appTranslucentColor

                Text {
                    id: weatherText
                    anchors {
                        verticalCenter: parent.verticalCenter
                        left: parent.left
                    }
                    text: " "
                    font.pixelSize: Math.min(weatherIconRect.width,
                                             weatherIconRect.height) * 0.4
                    color: Styles.appTextColor
                    font.family: Styles.txtFontFamily
                }
            }
        }
    }

    Component.onCompleted: {
        updateWeatherInfo()
    }



    function updateWeatherInfo() {

        if (mainController.weatherApi.weatherInfo.temperature && mainController.weatherApi.weatherInfo.iconId)
        {
            weatherText.text = mainController.weatherApi.weatherInfo.temperature.toFixed(1) + "°C";
            weatherImg.source = "http://openweathermap.org/img/wn/" + mainController.weatherApi.weatherInfo.iconId + "@2x.png";
        }
        else
        {
            weatherText.text = "25.0°C";
            weatherImg.source = "assets/images/WeatherDefault.png";

        }
    }

}
