#!/usr/bin/env python

from os import environ as env
from sys import stderr
from sqlite3 import connect as db_connect
from datetime import datetime

timestamp = datetime.now().strftime('%d%m%yT%H%M%S')
dump_file = '{}/{}-{}.sql'.format(env['DUMP_DIRECTORY'], env['BACKUP_PREFIX'], timestamp)

print('Dumping database to {}...'.format(dump_file), file=stderr)

with open(dump_file, 'w') as file:
  with db_connect(env['DATABASE_FILE']) as connection:
    for line in connection.iterdump():
      file.write('%s\n' % line)

print('Done'.format(dump_file), file=stderr)