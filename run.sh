#!/bin/sh

export PYTHONPATH="/opt/graphite/webapp";

if [ ! -f /opt/graphite/storage/graphite.db ]; then
	mkdir -p /opt/graphite/storage/log/webapp/
	sudo mkdir -p /opt/graphite/storage/graphite
	django-admin syncdb --noinput --settings=graphite.settings
	django-admin loaddata /opt/graphite/webapp/graphite/initial_data.json --settings=graphite.settings
	cd /opt/graphite/bin && sudo /opt/graphite/bin/build-index.sh
	chown -R www-data:www-data /opt/graphite/storage/log/webapp/
	chown -R www-data:www-data /opt/graphite/storage/index
	chown -R www-data:www-data /opt/graphite/storage/graphite
fi

if [ ! -d /opt/graphite/static ]; then
	django-admin collectstatic --noinput --settings=graphite.settings
	chown -R www-data:www-data /opt/graphite/static
fi

/usr/sbin/apachectl -D FOREGROUND