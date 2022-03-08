#!/bin/sh

PORT=8888
JAMSOCKET_JUPYTER_TOKEN=password123

docker build . -t jupyter-notebook

echo "\nstarting jupyter notebook"
echo "connect with token: $JAMSOCKET_JUPYTER_TOKEN \n"

docker run -p $PORT:$PORT --env JAMSOCKET_JUPYTER_TOKEN=$JAMSOCKET_JUPYTER_TOKEN -it jupyter-notebook
