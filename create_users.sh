#!/bin/bash

echo "----------> Passo 01: Criando diretórios <----------"

mkdir /publico
mkdir /adm
mkdir /ven
mkdir /sec

echo "----------> Passo 02: Criando grupos de usuários <----------"

groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

echo "----------> Passo 03: Criando usuários e adicionando eles aos grupos <----------"
## OBS: -crypt removido na versão 3.0 do OpenSSL
## Se não houver uma flag explicitamente indicando um algoritmo, a flag -1 é utilizada por padrão
## https://www.openssl.org/docs/man3.0/man1/openssl-passwd.html

useradd carlos -m -s /bin/bash -p $(openssl passwd Senha123) -G GRP_ADM
useradd maria -m -s /bin/bash -p $(openssl passwd Senha123) -G GRP_ADM
useradd joao -m -s /bin/bash -p $(openssl passwd Senha123) -G GRP_ADM

useradd debora -m -s /bin/bash -p $(openssl passwd Senha123) -G GRP_VEN
useradd sebastiana -m -s /bin/bash -p $(openssl passwd Senha123) -G GRP_VEN
useradd roberto -m -s /bin/bash -p $(openssl passwd Senha123) -G GRP_VEN

useradd josefina -m -s /bin/bash -p $(openssl passwd Senha123) -G GRP_SEC
useradd amanda -m -s /bin/bash -p $(openssl passwd Senha123) -G GRP_SEC
useradd rogerio -m -s /bin/bash -p $(openssl passwd Senha123) -G GRP_SEC

echo "----------> Passo 04: Especificando permissões dos diretórios <----------"

chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

chmod 770 /adm
chmod 770 /ven
chmod 770 /sec
chmod 777 /publico

echo "----------> Finalizado <----------"
