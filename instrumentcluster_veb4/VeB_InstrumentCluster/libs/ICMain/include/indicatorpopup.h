#ifndef INDICATORPOPUP_H
#define INDICATORPOPUP_H

#include <QObject>

class IndicatorPopup : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool showPopup READ showPopup WRITE setShowPopup NOTIFY showPopupChanged)

public:
    explicit IndicatorPopup(QObject *parent = nullptr);

    bool showPopup() const;

public slots:

    void setShowPopup(bool newShowPopup);

signals:
    void showPopupChanged();

private:
    bool m_showPopup;
};

#endif // INDICATORPOPUP_H
