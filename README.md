# RandomRuslan_infra
RandomRuslan Infra repository


# 5. Облачная инфраструктура
## SSH
Для подключения к внутреннему серверу через внешний в одну строку необходимо использовать `ProxyJump`:
```shell
ssh -i ~/.ssh/appuser -J <BASTION_USER>@<BASTION_SERVER> <INTERNAL_USER>@<INTERNAL_SERVER>
```

Сокращаем до вида `ssh someinternalhost`:
 - Создаем конфиг файл `~/.ssh/config`
 - Заполняем следующим кодом:
```shell
Host someinternalhost
  HostName <INTERNAL_SERVER>
  User <INTERNAL_USER>
  IdentityFile <PATH_TO_PRIVATE_KEY>
  ProxyJump <BASTION_USER>@<BASTION_SERVER>
```

Чтобы после этого подключаться исключительно по алиасу `someinternalhost`, необходимо:
 - Добавить в файл `~/.zshrc` (для OS X) добавить строку `alias someinternalhost="ssh someinternalhost"`
 - Выполнить `source ~/.zshrc`

## VPN-сервер

Домен по https:
```shell
https://84-252-139-85.sslip.io/
```

Данные для проверки:
```shell
bastion_IP = 84.252.139.85
someinternalhost_IP = 10.129.0.26
```

# 6. Основные сервисы Yandex Cloud

Команда создания инстанса:
```shell
yc compute instance create \
 --name reddit-app \
 --hostname reddit-app \
 --memory=4 \
 --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1604-lts,size=10GB \
 --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
 --metadata serial-port-enable=1 \
 --ssh-key ~/.ssh/appuser.pub \
 --zone ru-central1-a
```

Скрипты для запуска приложения:
 - install_ruby.sh
 - install_mongodb.sh
 - deploy.sh

Данные для проверки:
```shell
testapp_IP = 51.250.88.98
testapp_port = 9292
```

Для проверки необходимо открыть сайт `http://51.250.88.98:9292/`
