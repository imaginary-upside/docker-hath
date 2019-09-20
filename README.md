# Docker Compose Example
```yaml
version: "3"

services:
  hath:
    image: hath
    build: .
    environment:
      - CLIENT_ID=12345
      - CLIENT_KEY=BRaMQGhGr3MpA3rQkQP9
    ports:
      - "5000:5000"
    volumes:
      - /mnt/hath/cache:/opt/hath/cache
```

    chown 1050:1050 /mnt/hath/cache
    chmod 750 /mnt/hath/cache
    docker-compose up -d

# License
Licensed under GNU GPLv3
