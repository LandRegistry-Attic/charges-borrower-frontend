#! /usr/bin/bash

dot="$(cd "$(dirname "$0")"; pwd)"
cd $dot

pip3 install -r requirements.txt

gunicorn "app:create_app().app"
