
# Домашнее задание к занятию "5.1. Введение в виртуализацию. Типы и функции гипервизоров. Обзор рынка вендоров и областей применения."


## Задача 1

Опишите кратко, как вы поняли: в чем основное отличие полной (аппаратной) виртуализации, паравиртуализации и виртуализации на основе ОС.

```
Полная (аппаратная) виртуализация - наиболее близкая к аппаратному уровню хоста виртуализация, использующая его
ресурсы с максимальной пользой.
Паравиртуализация - включение дополнитей прослойки в виде ОС на железе и гирервизора, управляющего разделением ресурсов.
Виртуализация на основе ОС - запуск ВМ и/или контейнеров зависит от ядра (типа) ОС, установленной на хостовой машине.
```

## Задача 2

Выберите один из вариантов использования организации физических серверов, в зависимости от условий использования.

Организация серверов:
- физические сервера,
- паравиртуализация,
- виртуализация уровня ОС.

Условия использования:
- Высоконагруженная база данных, чувствительная к отказу.
- Различные web-приложения.
- Windows системы для использования бухгалтерским отделом.
- Системы, выполняющие высокопроизводительные расчеты на GPU.

Опишите, почему вы выбрали к каждому целевому использованию такую организацию.

```
Высоконагруженную БД, чувствительную к отказу - либо на системах полной виртуализации с репликацией или на
физических серверах.
Windows-системы для бухгалтерии прекрасно себя бы чувствовали на ProxMox или Hyper-V.
Web-приложения - на продуктах виртуализации на основе ОС, или, вообще, можно было бы завернуть в контейнеры.
Систему для вычислений на GPU я бы организовывал только на физических серверах, чтобы избежать накладных
расходов на виртуализацию графических адаптеров, хотя в тех же самых облаках они себя наверное
неплохо ведут на используемых системах виртуализации.
```

## Задача 3

Выберите подходящую систему управления виртуализацией для предложенного сценария. Детально опишите ваш выбор.

Сценарии:

1. 100 виртуальных машин на базе Linux и Windows, общие задачи, нет особых требований. Преимущественно Windows based инфраструктура, требуется реализация программных балансировщиков нагрузки, репликации данных и автоматизированного механизма создания резервных копий.
```
В этом случае нужно использовать VMware - т.к. весь требуемый функционал уже "из-коробки". Можно также попробовать
кластеры ProxMox, там есть функционал репликации и бэкапов виртуальных машин, уверен, что и LB
тоже имеется, к тому же бесплатно. 
```
2. Требуется наиболее производительное бесплатное open source решение для виртуализации небольшой (20-30 серверов) инфраструктуры на базе Linux и Windows виртуальных машин.
```
Наиболее произвидительное и бесплатное решение под небольшое количество ВМ - KVM.
```
3. Необходимо бесплатное, максимально совместимое и производительное решение для виртуализации Windows инфраструктуры.
```
Для Windows-инфраструктуры - Hyper-V.
```
4. Необходимо рабочее окружение для тестирования программного продукта на нескольких дистрибутивах Linux.
```
Проще всего Vagrant'ом создать виртуалки в VirtualBox или использовать Docker-контейнеры.
```

## Задача 4

Опишите возможные проблемы и недостатки гетерогенной среды виртуализации (использования нескольких систем управления виртуализацией одновременно) и что необходимо сделать для минимизации этих рисков и проблем. Если бы у вас был выбор, то создавали бы вы гетерогенную среду или нет? Мотивируйте ваш ответ примерами.
```
Поддержка нескольких систем управления виртуализацие требует наличия специалистов, умеющих налаживать взамодействие
между этими системами, знать особенности каждой.
Если бы у меня был выбор, то я использовал бы какую-либо одну систему виртуализации, но вполне допускаю,
что использование гетерогенных сред, а также "ВМ в ВМ" или "docker in docker"
имеет место быть и с этим придется разбираться.
```
