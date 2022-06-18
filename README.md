# RandomRuslan_infra
RandomRuslan Infra repository


# 5. Облачная инфраструктура
## SSH
Для подключения к внутреннему серверу через внешний в одну строку необходимо использовать `ProxyJump`:
```shell
ssh -i ~/.ssh/appuser -J <BASTION_USER>@<BASTION_SERVER> <INTERNAL_USER>@<INTERNAL_SERVER>
```

Сокращаем до вида `ssh someinternalhost`:
 - Создаем конфиг файл ~/.ssh/config
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
