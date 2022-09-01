# Дипломный практикум в YandexCloud

---
## Цели:

1. Зарегистрировать доменное имя (любое на ваш выбор в любой доменной зоне).
2. Подготовить инфраструктуру с помощью Terraform на базе облачного провайдера YandexCloud.
3. Настроить внешний Reverse Proxy на основе Nginx и LetsEncrypt.
4. Настроить кластер MySQL.
5. Установить WordPress.
6. Развернуть Gitlab CE и Gitlab Runner.
7. Настроить CI/CD для автоматического развёртывания приложения.
8. Настроить мониторинг инфраструктуры с помощью стека: Prometheus, Alert Manager и Grafana.

---
## Этапы выполнения:

### Регистрация доменного имени

![](img/01.png)

### Создание инфраструктуры

1. Создайте сервисный аккаунт

```
Создал руками
```

2. Подготовьте backend для Terraform:

```
Создал руками
```

![](img/s3.png)

3. Настройте [workspaces](https://www.terraform.io/docs/language/state/workspaces.html)

![](img/workspace.png)

4. Создайте VPC с подсетями в разных зонах доступности.

![](img/networks.png)

5. Убедитесь, что теперь вы можете выполнить команды `terraform destroy` и `terraform apply` без дополнительных ручных действий.

![](img/terr_apply.png)

![](img/terr_destroy.png)

![](img/full_view.png)

![](img/vm_created.png)

![](img/a_records.png)

![](img/upstream.png)

---
### Установка Nginx и LetsEncrypt

![](img/stage_cert.png)

---
### Установка кластера MySQL

![](img/databases.png)

---
### Установка WordPress

![](img/epogodin.png)

---
### Установка Gitlab CE и Gitlab Runner

![](img/gitlab.png)

![](img/runner.png)

---
### Установка Prometheus, Alert Manager, Node Exporter и Grafana

![](img/prometheus.png)

![](img/alertmanager.png)

![](img/grafana.png)

---
### Титры

![](img/output.png)

---
### Файлы конфигурации

[terraform](https://github.com/pogodin2004/netologyHomeWorks/tree/master/00.diplom/terraform)

[ansible](https://github.com/pogodin2004/netologyHomeWorks/tree/master/00.diplom/ansible)

---
### Доработки:
1. Сертификаты нужно все таки перевыпустить. У вас они не валидные. Соответственно задача до конца не выполнена

![](prod_cert.png)

![](img/prod_wordpress.png)

![](img/prod_gitlab.png)

![](img/prod_grafana.png)

![](img/prod_prometheus.png)

![](img/prod_alertmanager.png)

2. Прикрепите скрин/лог, подтверждающие, что db развернута в отказоустойчивом режиме.

![](img/db01.png)

![](img/db02.png)

3. Прикрепите скрин/лог, подтверждающие, что задача gitlab ci отработала корректно.

![](img/1.gitlab_result.png)

![](img/2.gitlab_repo.png)

![](img/3.gitlab_log.png)

![](img/4.gitlab_pipline.png)

![](img/5.gitlab_site.png)

![](img/6.gitlab_app_host.png)

