#!/usr/bin/env bash

sigquit() {
    echo "signal QUIT received"
}

sigint() {
    echo "signal INT received"
}

sighup() {
    echo "signal HUP received"
}

sigterm() {
    echo "signal TERM received"
}

trap 'sigquit' QUIT
trap 'sigint' INT
trap 'sighup' HUP
trap 'sigterm' TERM

echo "test script started. My PID is $$"
while :; do
    sleep 0.5
done
