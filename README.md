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

## Проводим анализ проблемных слоев

```bash
docker history go-app:bad
```

Удобная утилита

```bash
alias dive="docker run -ti --rm  -v /var/run/docker.sock:/var/run/docker.sock docker.io/wagoodman/dive"
dive go-app:bad
```
