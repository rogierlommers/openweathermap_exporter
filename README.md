# Openweather exporter for prometheus

Fetch weather data from openweathernap.org and expose as prometheus scrapable endpoint.

## How to run exporter in a docker container

- Create an API key from https://openweathermap.org/.
- Run container using the example docker run command below.
- Add the endpoint to your prometheus instance; see below example.

### Docker run command

```
docker run --name openweather-exporter \
          --rm \
          --env OWM_LOCATION=NIJMEGEN,NK \
          --env OWM_API_KEY=apikey \
          --ENV OWM_DELAY_IN_SECONDS=5 \
          --publish 2112:2112 \
          ows
```

### Prometheus scrape config

```
scrape_configs:
  - job_name: 'weather'
    scrape_interval: 60s
    static_configs:
      - targets: ['localhost:2112']
```
