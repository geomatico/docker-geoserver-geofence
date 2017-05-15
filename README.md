docker-geoserver-geofence
=========================

Dockerized GeoServer+GeoFence (not embedded; separate instance).


## Features

* Built on top of [Oscar Fonts' GeoServer image](https://hub.docker.com/r/oscarfonts/geoserver/).
* Uses an external PostgreSQL database instance for storing GeoFence data.

## Trusted builds

Active versions with [automated builds](https://hub.docker.com/r/geomatico/geoserver-geofence) available on [docker registry](https://registry.hub.docker.com/):

* [`latest`, `2.11.x`, `2.11.2` (*2.11.2/Dockerfile*)](https://github.com/geomatico/docker-geoserver-geofence/blob/master/2.11.0/Dockerfile)
* [`maintenance`, ``, `2.10.x`, `2.10.2` (*2.10.2/Dockerfile*)](https://github.com/geomatico/docker-geoserver-geofence/blob/master/2.10.2/Dockerfile)


## Running

Get the image:

```
docker pull geomatico/geoserver-geofence
```

Run as a service, exposing port 8080 and using a hosted GEOSERVER_DATA_DIR:

```
docker run -d -p 8080:8080 -v /path/to/local/data_dir:/var/local/geoserver localhost --name=geoserver-geofence geomatico/geoserver-geofence
```

**Important**: The GEOSERVER_DATA_DIR must contain a `geofence-ovr.properties` file with the connection parameters for your external PostGIS database. See an [example](https://github.com/geomatico/docker-geoserver-geofence/blob/master/2.11.0/data_dir/geofence-ovr.properties).
