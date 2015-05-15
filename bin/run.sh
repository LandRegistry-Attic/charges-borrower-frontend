#! /usr/bin/bash

virtualenv ./.service_env

source ./.service_env/bin/activate

pip3 install -r requirements.txt

gunicorn --pid /var/run/borrower_frontend.pid "app:create_manager().app"
