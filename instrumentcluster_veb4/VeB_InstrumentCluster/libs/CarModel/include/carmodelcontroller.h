#ifndef CARMODELCONTROLLER_H
#define CARMODELCONTROLLER_H
#include <QObject>

class CarModelController : public QObject
{
    Q_OBJECT
public:
    explicit CarModelController(QObject *parent = nullptr);

    ~CarModelController();

signals:

private:
};

#endif // CARMODELCONTROLLER_H
