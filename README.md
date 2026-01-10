# filterproxy
forward http/https proxy filtering requests by domain using a whitelist

## standalone example
```yaml
services:
  proxy:
    image: ghcr.io/knrdl/filterproxy:edge
    restart: always
    mem_limit: 100m
    ports:
      - 8080:8080
    environment:
      domains: |
        example.org
        github.com
```

```shell
curl --proxy http://localhost:8080 example.org  # will work
curl --proxy http://localhost:8080 example.com  # will NOT work (403 filtered)
```

## container example
```yaml
services:
  webapp:
    image: ...
    networks:
      - reverse_proxy
      - forward_proxy
    environment:
      https_proxy: http://proxy:8080

  proxy:
    image: ghcr.io/knrdl/filterproxy:edge
    restart: always
    mem_limit: 100m
    networks:
      - forward_proxy
      - internet
    environment:
      domains: |
        *.example.org

networks:
  reverse_proxy:
    name: reverse_proxy
    external: true  # defined somewhere else
  forward_proxy:
    internal: true  # without network access
  internet:
    internal: false  # with network access
```

