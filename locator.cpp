#include "locator.h"

Locator::Locator(QObject *parent) : QObject(parent)
{
    m_source = QGeoPositionInfoSource::createDefaultSource(this);
    if (m_source) {
        connect(m_source, SIGNAL(positionUpdated(QGeoPositionInfo)),
                this, SLOT(positionAcquired(QGeoPositionInfo)));

        QMap<QString,QVariant> params;
        params["here.app_id"] = "YcFcRULoKXQ7uFyyUFXi";
        params["here.token"] = "RrY07ZqUc93icAWoP0FDIg";

        m_provider = new QGeoServiceProvider("here", params);
        m_searcher =  m_provider->geocodingManager();
        connect(m_searcher,&QGeoCodingManager::finished, this, &Locator::addressAcquired);
        connect(m_searcher,&QGeoCodingManager::error, this, &Locator::error);
    }
}

void Locator::addressAcquired()
{
      QList<QGeoLocation> locations = data->locations();
      if(locations.size()>0){
          emit addressUpdatedView(locations[0].address().city());
      }
      m_source->stopUpdates();

}

void Locator::error()
{
    qDebug() << "ERROR" << endl;
}

void Locator::startLocation()
{
    m_source->startUpdates();
}

void Locator::positionAcquired(const QGeoPositionInfo &info)
{
    qDebug() << "poition update:" << info ;
    data = m_searcher->reverseGeocode(info.coordinate());
    emit positionUpdatedView(info.coordinate());
}
