# Firebird Dockerfile

[![Docker Pulls](https://img.shields.io/docker/pulls/almeida/firebird.svg)](https://hub.docker.com/r/almeida/firebird/)
[![Docker Stars](https://img.shields.io/docker/stars/almeida/firebird.svg)](https://hub.docker.com/r/almeida/firebird/)

## Description

### Provides

  Firebird SQL relational database (http://www.firebirdsql.org/).

### Volumes

 * /var/lib/firebird/2.5/backup
 * /var/lib/firebird/2.5/data

### Exposed Ports

 * 3050

### Firebird credentials

 * Username: SYSDBA
 * Password: masterkey

## Run

	$ docker run -d \
		--name firebird \	
		-p 3050:3050 \
		-v /somehostdir/firebird/backup/:/var/lib/firebird/2.5/backup/ \
		-v /somehostdir/firebird/data/:/var/lib/firebird/2.5/data/ \
		almeida/firebird

## Misc

### Restore backup

	//enter container console
	$ docker exec -i -t firebird /bin/bash

	//restore backup
	$ gbak -c -v -user SYSDBA -password masterkey /var/lib/firebird/2.5/backup/dbname.fbk localhost:/var/lib/firebird/2.5/data/dbname.fdb
