#!/bin/sh

set -e

virtualenv env
. env/bin/activate
pip install -r requirements.txt
pip freeze > freeze.txt
