# Prepare database
docker run -d -p 65432:5432 --name=postgis-geofence kartoza/postgis:9.3
sleep 5
export PGPASSWORD=docker
createdb -h localhost -p 65432 -U docker geofence
psql -h localhost -p 65432 -U docker -d geofence -c "CREATE EXTENSION postgis"

# Run
docker run -v $PWD/data_dir:/var/local/geoserver -d -p 8080:8080 --link postgis-geofence --name=geoserver-geofence geoserver-geofence

# Logs
docker logs -f geoserver-geofence 2>&1
#xdg-open http://localhost:8080/geoserver/web/
