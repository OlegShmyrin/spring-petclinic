#!/bin/sh

DESC="PetClinic Application"
NAME=petclinicd
PIDFILE=/var/run/$NAME.pid
RUN_AS=ubuntu
WORK_DIR=/src/petclinic/
DAEMON=/bin/java
DAEMON_OPTS="-jar $WORK_DIR/*.jar"

do_start() {
    start-stop-daemon --start --quiet --make-pidfile --pidfile $PIDFILE \
        --background \
        --chuid $RUN_AS \
        --chdir $WORK_DIR \
        --exec $DAEMON -- $DAEMON_OPTS
}

do_stop() {
    start-stop-daemon --stop --quiet --pidfile $PIDFILE
    if [ -e $PIDFILE ]
        then rm $PIDFILE
    fi
}

case "$1" in
    start)
    echo -n "Starting $DESC: $NAME"
    do_start
    echo "."
    ;;
    stop)
    echo -n "Stopping $DESC: $NAME"
    do_stop
    echo "."
    ;;
    restart)
    echo -n "Restarting $DESC: $NAME"
    do_stop
    sleep 1
    do_start
    echo "."
    ;;
    status)
    status_of_proc -p $PIDFILE "$DAEMON" "$NAME" && exit 0 || exit $?
    ;;
    *)
    echo "usage: $NAME {start|stop|restart}"
    exit 1
    ;;
esac