# jamsocket-jupyter-notebook
Base repo for running Jupyter Notebooks on the Jamsocket platform

## Steps

1. Fork this repository.
2. Add your notebook(s) to the `/notebook` directory.
3. Add your notebook's python dependencies to `requirements.txt`.
4. Update the `NOTEBOOK` value in `run.sh` to make sure Jupyter opens your notebook on start up. 
5. Add `JAMSOCKET_USER` and `JAMSOCKET_PASS` values to your GitHub secrets. (Contact us here to get Jamsocket credentials.)
6. Push your repo to your GitHub account, and your Jupyter Notebook container will be automatically built and pushed to Jamsocket.
7. Get a Spawn URL from us.

TODO: clean up these steps and update instructions on providing a JUPYTER_TOKEN?


## Customization

Place whatever notebook code you'd like to run in the `notebook` directory, and add any pip-installable dependencies to `requirements.txt`.

Provide a password as the `JAMSOCKET_JUPYTER_TOKEN` environment variable. This is the password the jupyter notebook server will expect the user to input through the UI when first accessing the notebook.

## To run the jupyter-notebook locally for testing:

```bash
docker build -t jupyter-notebook .
docker run -p 8080:8080 --env JAMSOCKET_JUPYTER_TOKEN=password123 --env PORT=8080 -it jupyter-notebook
open localhost:8080?token=password123
```
