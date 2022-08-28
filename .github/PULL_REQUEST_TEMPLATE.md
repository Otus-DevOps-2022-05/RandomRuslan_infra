# Выполнено ДЗ № 13
 - [+] Основное ДЗ: виртуальная среда с Vagrant, тесты с Molecule, образы с помощью ролей Ansible

## В процессе сделано:
1. Развернул виртуальную рабочую среду при помощи Vagrant и Ansible
2. Протестировал db-сервис при помощи Molecule
3. Создал образы в облаке при помощи ролей Ansible

## Как запустить проект:
```shell
cd .../XXX_infra/ansible && vagrant up

cd .../XXX_infra/ansible/roles/db && molecule verify

cd .../XXX_infra/ \
  && packer build -var-file packer/variables.json packer/app.json \
  && packer build -var-file packer/variables.json packer/db.json
```

## Как проверить работоспособность:
1. Открыть приложение в браузере: `10.10.10.20:9292` (Vagrant)
2. Запустить проверку тестов и увидеть "Verifier completed successfully" (Molecule)

## Примечание
Без паяльника и магии фей ничего не работает!
