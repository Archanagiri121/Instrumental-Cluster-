#include "include/indicatorpopup.h"

IndicatorPopup::IndicatorPopup(QObject *parent)
    : QObject{parent}
{}

bool IndicatorPopup::showPopup() const
{
    return m_showPopup;
}

void IndicatorPopup::setShowPopup(bool newShowPopup)
{
    m_showPopup = newShowPopup;
    emit showPopupChanged();
}
