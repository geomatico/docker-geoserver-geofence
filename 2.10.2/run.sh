# Prepare database
docker run -d -p 65432:5432 --name=postgis-geofence kartoza/postgis
sleep 60
export PGPASSWORD=docker
createdb -h localhost -p 65432 -U docker geofence
psql -h localhost -p 65432 -U docker -d geofence -c "CREATE EXTENSION postgis"

# Run
docker run -v $PWD/data_dir:/var/local/geoserver -d -p 8080:8080 --link postgis-geofence --name=geoserver-geofence geoserver-geofence:2.10.2

# Logs
docker logs -f geoserver-geofence 2>&1

