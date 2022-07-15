#!/bin/bash
#не стартовал python поэтому собрал образ сам
docker build -t ubuntu:test .
docker run -itd --name ubuntu ubuntu:test
docker run -itd --name centos7 centos:7
docker run -itd --name fedora fedora:latest
#можно было pass в файл положить
ansible-playbook -i inventory/extnd_prod.yml site.yml --ask-vault-pass
docker kill $(docker ps -q)
