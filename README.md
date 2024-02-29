# jamsocket-jupyter-notebook
Base repo for running Jupyter Notebooks on the Jamsocket platform

## Steps

1. Fork this repository.
2. Add your notebook(s) to the `/notebook` directory.
3. Add your notebook's python dependencies to `requirements.txt` (alternatively, if you prefer `pipenv`, add them with `pipenv install` and then run `pipenv run freeze`).
4. Replace `/notebooks/hello-jamsocket.ipynb` in `Dockerfile` with the path to the notebook you'd like to be automatically loaded. If you want the user to see a file listing of the `/notebooks` directory by default, remove that line entirely.
5. Run `./freeze.sh` to create a `freeze.txt` file from `requirements.txt`. This pins the version of all of the dependencies of the libraries in `requirements.txt`.
6. Set your account name as the `JAMSOCKET_ACCOUNT` value in your GitHub secrets.
7. Generate an access token at [app.jamsocket.com/settings](https://app.jamsocket.com/settings) and set it as the `JAMSOCKET_TOKEN` value in your GitHub secrets. ([Sign up](https://auth.jamsocket.com/signup) for a Jamsocket account if you don’t already have one.)
8. Push your repo to your GitHub account, and your Jupyter Notebook container will be automatically built and pushed to Jamsocket.
9. Get a Spawn URL from us. (Open this URL in a browser to start a new notebook instance.)

## To run the jupyter-notebook locally for testing:

```bash
docker build -t jupyter-notebook .
docker run -p 8080:8080 --env PORT=8080 -it jupyter-notebook
open localhost:8080
```
