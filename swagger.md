# Swagger-ui

To starte the swagger-ui, run:

    rails swagger:start

It starts swagger-ui in an docker image. Following can be configured:

- API_URL: Where lives the backend?
- PORT: Which port should swagger-ui bind to?

Example to start it with different configuration:

    API_URL=http://some.where.different PORT=99 rails swagger:start
