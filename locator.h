#ifndef LOCATOR_H
#define LOCATOR_H

#include <QObject>
#include <QGeoPositionInfoSource>
#include <QGeoCoordinate>
#include <QGeoServiceProvider>
#include <QGeoCodingManager>
#include <QGeoCodeReply>
#include <QGeoAddress>
#include <QtDebug>

class Locator : public QObject
{
    Q_OBJECT
public:
    explicit Locator(QObject *parent = nullptr);

signals:
    void addressUpdatedView(const QString address);
    void positionUpdatedView(const QGeoCoordinate &info);
public slots:
    void positionAcquired(const QGeoPositionInfo&);
    void addressAcquired();
    void error();
    void startLocation();
private:
    QGeoServiceProvider * m_provider;
    QGeoPositionInfoSource *m_source;
    QGeoCodingManager *m_searcher;
    QGeoCodeReply *data;

};

#endif // LOCATOR_H
