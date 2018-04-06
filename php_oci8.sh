#!/usr/bin/env bash

# update system
sudo apt-get update

# install dependencies
sudo apt-get install build-essential unzip libaio1 wget php-pear php7.0-dev

# INSTALL oci8 and oracle instant client
# create instant client installation folder
sudo mkdir -p /opt/oracle

# download required packages of oracle instant client
wget https://github.com/bumpx/oracle-instantclient/blob/master/instantclient-basic-linux-12.2.0.1.0.zip 
wget https://github.com/bumpx/oracle-instantclient/raw/master/instantclient-sdk-linux.x64-12.2.0.1.0.zip

# Unzip downlaoded package files to imstallation folder
sudo unzip -o ./instantclient-basic-linux.x64-12.2.0.1.0.zip -d /opt/oracle
sudo unzip -o ./instantclient-sdk-linux.x64-12.2.0.1.0.zip -d /opt/oracle

# create symbolic links
sudo ln -s /opt/oracle/instantclient/sqlplus /usr/bin/sqlplus
sudo ln -s /opt/oracle/instantclient_12_2 /opt/oracle/instantclient
sudo ln -s /opt/oracle/instantclient/libclntsh.so.12.2 /opt/oracle/instantclient/libclntsh.so
sudo ln -s /opt/oracle/instantclient/libocci.so.12.2 /opt/oracle/instantclient/libocci.so

# install oci8
echo 'instantclient,/opt/oracle/instantclient' | sudo pecl install oci8

