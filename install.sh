#!/bin/bash

#Configuration
NAME="Mikolaj"
NAME=$(whoami)
REPOSITORY=https://github.com/jkanclerz/computer-programming-4-2024.git
TMP_DEST=/tmp/ecommerce
VERSION=main

APP_USERNAME=ecommerce
APP_DEST=/opt/ecommerce

echo "Hello ${NAME}"

## Install base OS dependencies
dnf install -y -q cowsay tree mc

## GIT && Repository
dnf install -y -q git
rm -rf ${TMP_DEST} || true
git clone ${REPOSITORY} -b ${VERSION} ${TMP_DEST}

## JAVA RUNTIME
dnf install -y -q java-17-amazon-corretto maven-local-amazon-corretto17

## Create dir & user
adduser ${APP_USERNAME}
mkdir -p ${APP_DEST}

## Compile && Package
cd ${TMP_DEST} && mvn -DskipTests package
mv ${TMP_DEST}/target/*.jar ${APP_DEST}/app.jar
chown -R ${APP_USERNAME}:${APP_USERNAME} ${APP_DEST}
rm -rf ${TMP_DEST}


echo "java -jar -Dserver.port=8080 /opt/ecommerce/app.jar"
