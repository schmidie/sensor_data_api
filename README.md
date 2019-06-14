
## Sensor Data API (still in development)

An interface for sensor-metrics to:
* **write** sensor-measurements
* **query** sensor-measurements
* **manage** sensor-nodes
* manage **permissions**

Seamless Integrations with:
* https://github.com/schmidie/arduino_onewire_gateway
* Database of choise:
  * influxDB
  * PostgreSQL
  * MariaDB/MySQL
  * ?
* Grafana/Kibana

-----
Start server
```
rails s
```
Run documentation:
```
rails swagger:start
```
