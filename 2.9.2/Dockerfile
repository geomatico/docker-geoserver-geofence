FROM oscarfonts/geoserver:2.9.2

MAINTAINER Víctor González <victor.gonzalez@geomati.co>

ENV MAJOR_VERSION 2.9

WORKDIR /usr/local/tomcat/webapps/

# Install Geofence webapp
RUN wget http://ares.boundlessgeo.com/geofence/master/geofence-master-latest-war.zip \
	&& unzip geofence-master-latest-war.zip \
	&& rm geofence-master-latest-war.zip \
  && unzip -d geofence gui/web/target/geofence.war \
  && rm geofence/WEB-INF/lib/persistence-api-1.0.jar # They currently package incompatible API jars

# Install Geofence extension in GeoServer
RUN wget http://ares.boundlessgeo.com/geoserver/${MAJOR_VERSION}.x/community-latest/geoserver-${MAJOR_VERSION}-SNAPSHOT-geofence-plugin.zip \
  && unzip -d ${GEOSERVER_INSTALL_DIR}/WEB-INF/lib geoserver-${MAJOR_VERSION}-SNAPSHOT-geofence-plugin.zip \
  && rm geoserver-${MAJOR_VERSION}-SNAPSHOT-geofence-plugin.zip

# Use PostGIS as backend
RUN rm geofence/WEB-INF/lib/hibernate-spatial-h2-geodb-1.1.1.jar \
  && cp geofence/WEB-INF/spatial-lib/hibernate-spatial-postgis-1.1.1.jar geofence/WEB-INF/lib/

# Remove datasource settings from classpath because it takes precedence over the -Dgeofence-ovr property
RUN rm geofence/WEB-INF/classes/geofence-datasource-ovr.properties

# Configure datasource settings file in GeoServer data dir
ENV CATALINA_OPTS "${CATALINA_OPTS} -Dgeofence-ovr=file:${GEOSERVER_DATA_DIR}/geofence-ovr.properties

