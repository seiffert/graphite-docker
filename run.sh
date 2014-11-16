#!/bin/sh

if [ ! -f /opt/graphite/storage/graphite.db ]; then
	mkdir -p /opt/graphite/storage/log/webapp/
	sudo mkdir -p /opt/graphite/storage/graphite
	PYTHONPATH=/opt/graphite/webapp django-admin syncdb --noinput --settings=graphite.settings
	cd /opt/graphite/bin && sudo /opt/graphite/bin/build-index.sh
	chown -R www-data:www-data /opt/graphite/storage/log/webapp/
	chown -R www-data:www-data /opt/graphite/storage/index
	chown -R www-data:www-data /opt/graphite/storage/graphite
fi

/usr/sbin/apachectl -D FOREGROUND