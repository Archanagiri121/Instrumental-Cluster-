qt_add_library(ICMain STATIC)

set(icMainHeader
    include/maincontroller.h
    include/WeatherApi.h
    include/WeatherInfo.h
    include/vehiclemetrics.h
    include/keyhandler.h
    include/iniconfiguration.h
    include/menuselection.h
    include/iniconfiguration.h
)

set(icMainSource
    src/maincontroller.cpp
    src/WeatherApi.cpp
    src/WeatherInfo.cpp
    src/vehiclemetrics.cpp
    src/keyhandler.cpp
    src/iniconfiguration.cpp
    src/menuselection.cpp
    src/iniconfiguration.cpp
)

set_source_files_properties(Styles.qml
    PROPERTIES
    QT_QML_SINGLETON_TYPE true
)

qt_add_qml_module(
    ICMain
    URI "ICMain"
    VERSION 1.0
    QML_FILES
    BoundaryBox.qml
    ICHomescreen.qml
    SpeedoMeter.qml
    RangeMeter.qml
    Odometer.qml
    DateTime.qml
    Styles.qml
    WeatherPage.qml
    BatteryMeter.qml
    RegenMeter.qml
    MenuSection.qml
    IndicatorPopup.qml

    RESOURCES
    assets/images/lowerCurve.svg
    assets/images/regenrativeBraking.png
    assets/images/homeIcon.png
    assets/images/navigationIcon.png
    assets/images/tripIcon.png
    assets/images/warnings.png
    assets/images/lowBattery.png
    assets/images/ecoCarImg.png
    assets/images/charging.png
    assets/images/WeatherDefault.png

    SOURCES
    ${icMainHeader}
    ${icMainSource}
)

target_link_libraries(
    ICMain
    PRIVATE Qt6::Quick
    Qt6::Core
    Qt::Gui

    PUBLIC
    CarModelplugin
    Navigationplugin
    TripInfoplugin
    WarningIndicatorsplugin
    ICSimulationplugin
)
