# jamsocket-jupyter-notebook
Base repo for running Jupyter Notebooks on the Jamsocket platform

## Deploying

1. Log in to [Jamsocket](https://jamsocket.com) and create a new service called `jupyter-notebook`. ([Sign up](https://auth.jamsocket.com/signup) for a Jamsocket account if you don’t already have one. You can do everything listed here on the free plan.)
2. Reach out to us on [Discord](https://discord.gg/RFrDbMVKxv) or [by email](mailto:hi@jamsocket.com) to ask us to **enable Jamsocket compatibility mode** for that service. (This will soon be exposed directly in the web UI, but it's a manual step for now.)
3. Fork this repo as `jupyter-notebook` to your own GitHub account. Note that the name of the repo should match the name of the service, but you can use another name as long as they both match.
4. Set your Jamsocket account name as the `JAMSOCKET_ACCOUNT` value in your GitHub secrets.
5. Generate an access token at [app.jamsocket.com/settings](https://app.jamsocket.com/settings) and set it as the `JAMSOCKET_TOKEN` value in your GitHub secrets.
6. Push your repo to your GitHub account, and your Jupyter Notebook container will be automatically built and pushed to the Jamsocket service you selected.
7. [Use the Jamsocket API](https://docs.jamsocket.com/platform/advanced/connection-url) to spawn instances of your notebook. It will return a URL that you can use to access the notebook.

## Customizing

You can customize the initial notebook(s) and Python packages as follows:

1. Add your notebook(s) to the `/notebook` directory.
2. Add your notebook's python dependencies to `requirements.txt` (alternatively, if you prefer `pipenv`, add them with `pipenv install` and then run `pipenv run freeze`).
3. Replace `/notebooks/hello-jamsocket.ipynb` in `Dockerfile` with the path to the notebook you'd like to be automatically loaded. If you want the user to see a file listing of the `/notebooks` directory by default, remove that line entirely.
4. Run `./freeze.sh` to create a `freeze.txt` file from `requirements.txt`. This pins the version of all of the dependencies of the libraries in `requirements.txt`.


## To run the jupyter-notebook locally for testing:

```bash
docker build -t jupyter-notebook .
docker run -p 8080:8080 --env PORT=8080 -it jupyter-notebook
open localhost:8080
```

## Jupyter Lab

By default, this runs the `jupyter notebook` command. If you want to run the `jupyter lab` command instead, you can set the `JUPYTER_SUBCOMMAND` environment variable to `lab`.
