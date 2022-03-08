#!/bin/sh

jupyter notebook --generate-config
echo "c.NotebookApp.token = '$JAMSOCKET_JUPYTER_TOKEN'" >> ~/.jupyter/jupyter_notebook_config.py

jupyter notebook --ip 0.0.0.0 --no-browser
