
name="borrower_frontend"

RUNAS="root"
SCRIPT="./opt/${name}/bin/run.sh"

PIDFILE="/var/run/${name}.pid"
LOGFILE="/var/log/${name}.log"

function start() {
  if [ -f /var/run/$PIDNAME ] && kill -0 $(cat /var/run/$PIDNAME); then
    echo "Service $name already running" >&2
    return 1
  fi
  echo "Starting service $name ..." >&2
  local CMD="$SCRIPT &> \"$LOGFILE\" & echo \$!"
  su -c "$CMD" $RUNAS > "$PIDFILE"
  echo "Service $name started" >&2
}

function stop() {
  if [ ! -f "$PIDFILE" ] || ! kill -0 $(cat "$PIDFILE"); then
    echo "Service ${name} not running" >&2
    return 1
  fi
  echo "Stopping service ${name}..." >&2
  kill -15 $(cat "$PIDFILE") && rm -f "$PIDFILE"
  echo "Service $name stopped" >&2
}

case "$1" in
  start)
    start
    ;;
  stop)
    stop
    ;;
  restart)
    stop
    start
    ;;
  *)
    echo "Usage: $0 {start|stop|restart}"
esac
