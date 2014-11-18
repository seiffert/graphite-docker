SECRET_KEY = 'THISisSoSecret'

DATABASES = {
    'default': {
        'NAME': '/opt/graphite/storage/graphite/graphite.db',
        'ENGINE': 'django.db.backends.sqlite3',
        'USER': '',
        'PASSWORD': '',
        'HOST': '',
        'PORT': ''
    }
}

CONF_DIR = '/opt/graphite/conf'
STORAGE_DIR = '/opt/graphite/storage'
STATIC_ROOT = '/opt/graphite/static'