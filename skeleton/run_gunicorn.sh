#!/bin/bash
set -e
LOGFILE=!GUNICORN_LOG!
PIDFILE=!GUNICORN_PID!
LOGDIR=$(dirname $LOGFILE)
PIDDIR=$(dirname $PIDFILE)
GUNICORN_CFGFILE=!GUNICORN_CFGFILE!
# user/group to run as
USER=!SERVER_USER!
GROUP=!SERVER_USER!
ADDRESS=127.0.0.1:8000
cd !PROJ_DIR!
source !VROOT!/bin/activate
test -d $LOGDIR || mkdir -p $LOGDIR
test -d $PIDDIR || mkdir -p $PIDDIR
exec run-program gunicorn_django -c $GUNICORN_CFGFILE\
    --user=$USER --group=$GROUP --log-level=debug --pid=$PIDFILE\
    --log-file=$LOGFILE 2>>$LOGFILE
