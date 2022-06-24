# jamsocket-jupyter-notebook
Base repo for running Jupyter Notebooks on the Jamsocket platform

## Steps

1. Fork this repository.
2. Add your notebook(s) to the `/notebook` directory.
3. Add your notebook's python dependencies to `requirements.txt`.
4. Update the `NOTEBOOK` value in `run.sh` to make sure Jupyter opens your notebook on start up. 
5. Add `JAMSOCKET_USER` and `JAMSOCKET_TOKEN` values to your GitHub secrets. (Contact us to get Jamsocket credentials.)
6. Push your repo to your GitHub account, and your Jupyter Notebook container will be automatically built and pushed to Jamsocket.
7. Get a Spawn URL from us.

## Customization

You can optionally password-protect your notebook by editing the `JUPYTER_NOTEBOOK_PASSWORD` in `run.sh`.

## To run the jupyter-notebook locally for testing:

```bash
docker build -t jupyter-notebook .
docker run -p 8080:8080 --env PORT=8080 -it jupyter-notebook
open localhost:8080
```
