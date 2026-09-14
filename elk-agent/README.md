# Elastic Agent

Инструкция по развёртыванию Elastic Agent на Docker-хосте.

## Подготовка

Скопируйте каталог `elk-agent` на сервер, например в `/opt/elk_agent/`, и
перейдите в него:

```bash
cd /opt/elk_agent
chmod +x deploy.sh
```

Для работы скрипту нужен enrollment token из Fleet. Не добавляйте токен в
репозиторий и не сохраняйте его в открытом виде в shell history.

## Запуск

Передайте токен только на время выполнения скрипта:

```bash
FLEET_ENROLLMENT_TOKEN='TOKEN_IS_HERE' ./deploy.sh
```

Если агент запускается несколько раз, токен можно временно сохранить в
переменной окружения:

```bash
export FLEET_ENROLLMENT_TOKEN='TOKEN_IS_HERE'
./deploy.sh
unset FLEET_ENROLLMENT_TOKEN
```

Для интерактивного ввода токена без отображения символов используйте:

```bash
read -rs FLEET_ENROLLMENT_TOKEN
export FLEET_ENROLLMENT_TOKEN
./deploy.sh
unset FLEET_ENROLLMENT_TOKEN
```

Скрипт создаёт `.env`, определяет короткое имя хоста и запускает контейнер в
фоновом режиме. Состояние Elastic Agent сохраняется во внешнем Docker volume.

## Проверка

Проверьте состояние контейнера и последние записи журнала:

```bash
docker compose ps
docker compose logs -f elastic-agent
```

Имя контейнера формируется на основе hostname хоста:
`docker_agent_<hostname>`.
