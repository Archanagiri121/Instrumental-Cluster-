#include "include/navigationcontroller.h"
#include "qdebug.h"

NavigationController::NavigationController(QObject *parent)
    : QObject{parent}
{
    qDebug(__FUNCTION__);
}

NavigationController::~NavigationController()
{
    qDebug() << __FUNCTION__ << "Navigation destroyed";
}

QString NavigationController::manuverInstruction() const
{
    return m_manuverInstruction;
}

void NavigationController::setManuverInstruction(const QString &newManuverInstruction)
{
    m_manuverInstruction = newManuverInstruction;
    emit manuverInstructionChanged();
}

int NavigationController::manuverEnum() const
{
    return m_manuverEnum;
}

void NavigationController::setManuverEnum(int newManuverEnum)
{
    m_manuverEnum = newManuverEnum;

    switch (m_manuverEnum) {
    case 0:
        setDirectionImage("assets/Image/Straight.png");
        break;
    case 1:
        setDirectionImage("assets/Image/Straight.png");
        break;
    case 2:
        setDirectionImage("assets/Image/slightRight.png");
        break;
    case 3:
        setDirectionImage("assets/Image/slightRight.png");
        break;
    case 4:
        setDirectionImage("assets/Image/turnRight.png");
        break;
    case 5:
        setDirectionImage("assets/Image/turnRight.png");
        break;
    case 6:
        setDirectionImage("assets/Image/uturnLeft.png");
        break;
    case 7:
        setDirectionImage("assets/Image/uturnRight.png");
        break;
    case 8:
        setDirectionImage("assets/Image/turnLeft.png");
        break;
    case 9:
        setDirectionImage("assets/Image/turnLeft.png");
        break;
    case 10:
        setDirectionImage("assets/Image/slightLeft.png");
        break;
    case 11:
        setDirectionImage("assets/Image/slightLeft.png");
        break;
    default:
        setDirectionImage("assets/Image/Straight.png");
        break;
    }
    emit manuverEnumChanged();
}

QString NavigationController::directionImage() const
{
    return m_directionImage;
}

void NavigationController::setDirectionImage(const QString &newDirectionImage)
{
    m_directionImage = newDirectionImage;
    emit directionImageChanged();
}

QString NavigationController::updateImage() const
{
    return m_updateImage;
}

void NavigationController::setUpdateImage(const QString &newUpdateImage)
{
    m_updateImage = newUpdateImage;
    emit updateImageChanged();
}

QString NavigationController::startPointLatitude() const
{
    return m_startPointLatitude;
}

void NavigationController::setStartPointLatitude(const QString &newStartPointLatitude)
{
    m_startPointLatitude = newStartPointLatitude;
    emit startPointLatitudeChanged();
}

QString NavigationController::startPointLongitude() const
{
    return m_startPointLongitude;
}

void NavigationController::setStartPointLongitude(const QString &newStartPointLongitude)
{
    m_startPointLongitude = newStartPointLongitude;
    emit startPointLongitudeChanged();
}

QString NavigationController::endPointLatitude() const
{
    return m_endPointLatitude;
}

void NavigationController::setEndPointLatitude(const QString &newEndPointLatitude)
{
    m_endPointLatitude = newEndPointLatitude;
    emit endPointLatitudeChanged();
}

QString NavigationController::endPointLongitude() const
{
    return m_endPointLongitude;
}

void NavigationController::setEndPointLongitude(const QString &newEndPointLongitude)
{
    m_endPointLongitude = newEndPointLongitude;
    emit endPointLongitudeChanged();
}

QString NavigationController::startLocationName() const
{
    return m_startLocationName;
}

void NavigationController::setStartLocationName(const QString &newStartLocationName)
{
    m_startLocationName = newStartLocationName;
    emit startLocationNameChanged();
}

QString NavigationController::endLocationName() const
{
    return m_endLocationName;
}

void NavigationController::setEndLocationName(const QString &newEndLocationName)
{
    m_endLocationName = newEndLocationName;
    emit endLocationNameChanged();
}
