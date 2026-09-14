# Docker-инфраструктура

Репозиторий содержит Docker-конфигурации для запуска Prometheus и Elastic
Agent.

## Структура

- `docker-compose(prometheus).yml` — запуск Prometheus.
- `elk-agent/` — сборка и запуск Elastic Agent с регистрацией в Fleet.

## Prometheus

Перед запуском убедитесь, что существуют внешний Docker volume
`prometheus-data` и каталог `/root/prometheusconf` с файлом
`prometheus.yml`.

```bash
docker volume create prometheus-data
docker compose -f 'docker-compose(prometheus).yml' up -d
```

Prometheus будет доступен по адресу <http://localhost:9090>.

## Elastic Agent

Инструкция по развёртыванию Elastic Agent находится в
[`elk-agent/README.md`](elk-agent/README.md).

## Требования

- Docker Engine с поддержкой Docker Compose.
- Доступ к Fleet Server.
- Enrollment token для регистрации Elastic Agent.
