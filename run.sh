#!/bin/sh

jupyter notebook --generate-config

# protect your notebook with a password on the following line:
JUPYTER_NOTEBOOK_PASSWORD=""
echo "c.NotebookApp.token = '$JUPYTER_NOTEBOOK_PASSWORD'" >> ~/.jupyter/jupyter_notebook_config.py

# provide the notebook you want to start Jupyter with on the following line:
NOTEBOOK="hello-tmpenv.ipynb"
echo "c.NotebookApp.default_url = '/notebooks/$NOTEBOOK'" >> ~/.jupyter/jupyter_notebook_config.py

# to embed the jupyter notebook in an iframe, uncomment the following line and edit your domain
# echo "c.NotebookApp.tornado_settings = {'headers': {'Content-Security-Policy': 'frame-ancestors \'self\' [YOUR DOMAIN];'}}" >> ~/.jupyter/jupyter_notebook_config.py

jupyter notebook --ip 0.0.0.0 --port $PORT --no-browser
