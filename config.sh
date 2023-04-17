#!/bin/sh

# ================================
# Beginning of user-editable part.
# ================================

# Set the default notebook.
NOTEBOOK="hello-tmpenv.ipynb"

# Optional: pass settings for tornado to allow embedding in an iframe. (Replace [YOUR DOMAIN] with your domain.)
# TORNADO_SETTINGS="{'headers': {'Content-Security-Policy': 'frame-ancestors \'self\' [YOUR DOMAIN];'}}"

# ================================
# End of user-editable part.
# ================================

set -e

/home/jupyter/notebook-env/bin/jupyter notebook --generate-config

if [ -n "$NOTEBOOK" ]; then
    echo "c.NotebookApp.default_url = '/notebooks/$NOTEBOOK'" >> ~/.jupyter/jupyter_notebook_config.py
fi

if [ -n "$TORNADO_SETTINGS" ]; then
    echo "c.NotebookApp.tornado_settings = $TORNADO_SETTINGS" >> ~/.jupyter/jupyter_notebook_config.py
fi
