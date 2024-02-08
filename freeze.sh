#!/bin/sh

set -e

python3 -m virtualenv env
. env/bin/activate
pip install -r requirements.txt
pip freeze > freeze.txt
