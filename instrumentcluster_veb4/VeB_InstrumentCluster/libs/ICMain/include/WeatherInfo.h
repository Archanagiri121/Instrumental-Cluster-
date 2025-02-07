#ifndef WEATHERINFO_H
#define WEATHERINFO_H

#include <QObject>

class WeatherInfo : public QObject
{
    Q_OBJECT
    Q_PROPERTY(double temperature READ temperature WRITE setTemperature NOTIFY temperatureChanged)
    Q_PROPERTY(QString iconId READ iconId WRITE setIconId NOTIFY iconIdChanged)

public:
    explicit WeatherInfo(QObject *parent = nullptr);

    void setTemperature(double temperature);
    void setIconId(const QString &iconId);
    double temperature() const;
    QString iconId() const;

signals:
    void temperatureChanged(double temperature);
    void iconIdChanged(const QString &iconId);

private:
    double m_temperature;
    QString m_iconId;
};

#endif // WEATHERINFO_H
