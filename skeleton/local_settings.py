import os

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3', # Add 'postgresql_psycopg2', 'postgresql', 'mysql', 'sqlite3' or 'oracle'.
        'NAME': os.path.join('!INSTALL_ROOT!', 'db.sqlite3'),                      # Or path to database file if using sqlite3.
    }
}
