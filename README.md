# filterproxy
forward http/https proxy filtering requests by domain using a whitelist

```yaml
version: "2.4"

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
