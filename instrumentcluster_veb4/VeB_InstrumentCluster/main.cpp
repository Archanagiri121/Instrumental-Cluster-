#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlEngine>
#include <QQmlContext>
#include <QPixmap>
#include <QTimer>
#include <QPainter>
#include <QBitmap>
#include "libs/ICMain/include/maincontroller.h"

int main(int argc, char *argv[])
{

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    QScopedPointer<MainController> mainController{new MainController(app, &engine)};

    engine.rootContext()->setContextProperty("mainController", mainController.data());

    const QUrl url(QStringLiteral("file:appVeB_InstrumentCluster/main.qml"));
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreated,
        &app,
        [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
