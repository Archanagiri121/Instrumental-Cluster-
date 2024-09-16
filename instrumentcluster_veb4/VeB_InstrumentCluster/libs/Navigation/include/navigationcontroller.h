#ifndef NAVIGATIONCONTROLLER_H
#define NAVIGATIONCONTROLLER_H

#include <QObject>

class NavigationController : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString manuverInstruction READ manuverInstruction WRITE setManuverInstruction NOTIFY
                   manuverInstructionChanged)
    Q_PROPERTY(int manuverEnum READ manuverEnum WRITE setManuverEnum NOTIFY manuverEnumChanged)
    Q_PROPERTY(QString directionImage READ directionImage WRITE setDirectionImage NOTIFY
                   directionImageChanged)
    Q_PROPERTY(QString updateImage READ updateImage WRITE setUpdateImage NOTIFY updateImageChanged)
    Q_PROPERTY(QString startPointLatitude READ startPointLatitude WRITE setStartPointLatitude NOTIFY
                   startPointLatitudeChanged)
    Q_PROPERTY(QString startPointLongitude READ startPointLongitude WRITE setStartPointLongitude
                   NOTIFY startPointLongitudeChanged)
    Q_PROPERTY(QString endPointLatitude READ endPointLatitude WRITE setEndPointLatitude NOTIFY
                   endPointLatitudeChanged)
    Q_PROPERTY(QString endPointLongitude READ endPointLongitude WRITE setEndPointLongitude NOTIFY
                   endPointLongitudeChanged)
    Q_PROPERTY(QString startLocationName READ startLocationName WRITE setStartLocationName NOTIFY
                   startLocationNameChanged)
    Q_PROPERTY(QString endLocationName READ endLocationName WRITE setEndLocationName NOTIFY
                   endLocationNameChanged)

public:
    explicit NavigationController(QObject *parent = nullptr);
    ~NavigationController();

    int manuverEnum() const;
    QString manuverInstruction() const;
    QString directionImage() const;
    QString updateImage() const;

    QString startPointLatitude() const;

    QString startPointLongitude() const;

    QString endPointLatitude() const;

    QString endPointLongitude() const;

    QString startLocationName() const;

    QString endLocationName() const;

public slots:

    void setStartPointLongitude(const QString &newStartPointLongitude);
    void setStartPointLatitude(const QString &newStartPointLatitude);
    void setEndPointLatitude(const QString &newEndPointLatitude);
    void setEndPointLongitude(const QString &newEndPointLongitude);
    void setStartLocationName(const QString &newStartLocationName);
    void setEndLocationName(const QString &newEndLocationName);
    void setUpdateImage(const QString &newUpdateImage);
    void setDirectionImage(const QString &newDirectionImage);
    void setManuverEnum(int newManuverEnum);
    void setManuverInstruction(const QString &newManuverInstruction);

signals:
    void manuverInstructionChanged();
    void manuverEnumChanged();
    void directionImageChanged();
    void updateImageChanged();

    void startPointLatitudeChanged();

    void startPointLongitudeChanged();

    void endPointLatitudeChanged();

    void endPointLongitudeChanged();

    void startLocationNameChanged();

    void endLocationNameChanged();

private:
    int m_manuverEnum;
    QString m_manuverInstruction;
    QString m_directionImage = "assets/Image/Straight.png";
    QString m_updateImage;
    QString m_startPointLatitude;
    QString m_startPointLongitude;
    QString m_endPointLatitude;
    QString m_endPointLongitude;
    QString m_startLocationName;
    QString m_endLocationName;
};

#endif // NAVIGATIONCONTROLLER_H
