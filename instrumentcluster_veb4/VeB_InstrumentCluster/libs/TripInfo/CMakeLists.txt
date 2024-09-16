qt_add_library(TripInfo STATIC)

set(tripInfoModelHeader
    include/tripinfocontroller.h
    include/tripdata.h
)
set(tripInfoModelSource
    src/tripinfocontroller.cpp
    src/tripdata.cpp
)

qt_add_qml_module(
    TripInfo
    URI "TripInfo"
    VERSION 1.0

    SOURCES
    ${tripInfoModelHeader}
    ${tripInfoModelSource}

    QML_FILES
    TripInfo.qml
    CustomTripElement.qml

    RESOURCES
    asset/images/Trip_Start.png
    asset/images/Trip_Destination.png
    asset/images/Travel_Distance.png
    asset/images/Travel_Time.png
    asset/images/Average_Speed.png
    asset/images/Energy_Consumption.png
)

target_link_libraries(
    TripInfo
    PRIVATE
    Qt6::Quick
    Qt6::Core
    Qt::Gui
)
