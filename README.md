# Docker-образ весит 1.5 GB. Как похудеть?

## Создание окружения и генератор мусора

```bash
chmod u+x inflate.sh
```

```bash
./inflate.sh
```

## Собираем образ

```bash
docker build -t app:bad -f Dockerfile.bad .
```

```bash
docker images | grep go-app
```

```bash
docker history go-app:bad
```

```bash
dive go-app:bad
```
