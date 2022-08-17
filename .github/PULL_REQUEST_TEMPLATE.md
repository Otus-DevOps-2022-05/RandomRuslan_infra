# Выполнено ДЗ № 12
 - [+] Основное ДЗ: разделение по ролям и окружениям.

## В процессе сделано:
1. Разбил логику на роли: app, db
2. Сделал два окружения: stage, prod

## Как запустить проект:
```shell
cd .../XXX_infra/terraform/stage && terraform apply
cd .../XXX_infra/ansible && ansible-playbook playbooks/site.yml

cd .../XXX_infra/terraform/stage && terraform apply
cd .../XXX_infra/ansible && ansible-playbook -i environments/prod/inventory.sh playbooks/site.yml
```

## Как проверить работоспособность:
1. Открыть приложение в браузере: `<external_ip_address_app>:9292`
2. Создать запись, чтобы проверить коннект к бд
