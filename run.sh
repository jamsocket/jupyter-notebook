#!/bin/sh

jupyter notebook --generate-config
echo "c.NotebookApp.token = '$JAMSOCKET_JUPYTER_TOKEN'" >> ~/.jupyter/jupyter_notebook_config.py

# automatically redirect / to a notebook by uncommenting and editing the following line:
# echo "c.NotebookApp.default_url = '/notebooks/[YOUR NOTEBOOK HERE].ipynb'" >> ~/.jupyter/jupyter_notebook_config.py

# to embed the jupyter notebook in an iframe, uncomment the following line and edit your domain
# echo "c.NotebookApp.tornado_settings = {'headers': {'Content-Security-Policy': 'frame-ancestors \'self\' [YOUR DOMAIN];'}}" >> ~/.jupyter/jupyter_notebook_config.py

jupyter notebook --ip 0.0.0.0 --port 8080 --no-browser
