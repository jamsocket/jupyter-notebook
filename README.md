# jamsocket-jupyter-notebook
Base repo for running Jupyter Notebooks on the Jamsocket platform

## Steps

1. Fork this repository.
2. Add your notebook(s) to the `/notebook` directory.
3. Add your notebook's python dependencies to `requirements.txt`.
4. Update the `NOTEBOOK` value in `run.sh` to make sure Jupyter opens your notebook on start up.
5. Set your account name as the `JAMSOCKET_ACCOUNT` value in your GitHub secrets.
6. Generate an access token at [app.jamsocket.com/settings](https://app.jamsocket.com/settings) and set it as the `JAMSOCKET_TOKEN` value in your GitHub secrets. ([Contact us](https://forms.gle/2xjUy4AmR5tdj42Y7) to get a Jamsocket account if you don't have one.)
7. Push your repo to your GitHub account, and your Jupyter Notebook container will be automatically built and pushed to Jamsocket.
8. Get a Spawn URL from us. (Open this URL in a browser to start a new tmpenv.)

## Customization

You can optionally password-protect your notebook by editing the `JUPYTER_NOTEBOOK_PASSWORD` in `run.sh`.

## To run the jupyter-notebook locally for testing:

```bash
docker build -t jupyter-notebook .
docker run -p 8080:8080 --env PORT=8080 -it jupyter-notebook
open localhost:8080
```
