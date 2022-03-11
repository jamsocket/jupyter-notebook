#!/bin/sh

jupyter notebook --generate-config
echo "c.NotebookApp.token = '$JAMSOCKET_JUPYTER_TOKEN'" >> ~/.jupyter/jupyter_notebook_config.py

# automatically redirect / to a notebook by uncommenting and editing the following line:
echo "c.NotebookApp.default_url = '/notebooks/test.ipynb'" >> ~/.jupyter/jupyter_notebook_config.py

# to embed the jupyter notebook in an iframe, uncomment the following line and edit your domain
echo "c.NotebookApp.tornado_settings = {'headers': {'Content-Security-Policy': 'frame-ancestors *;'}}" >> ~/.jupyter/jupyter_notebook_config.py

# depending on your setup, you may need to disable XSRF checks, uncomment the following line to do that
# echo "c.NotebookApp.disable_check_xsrf = True" >> ~/.jupyter/jupyter_notebook_config.py

jupyter notebook --ip 0.0.0.0 --no-browser
