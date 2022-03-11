# jamsocket-jupyter-notebook
Scaffold for setting up a hosted jupyter notebook on the Jamsocket platform

## To run jupyter-notebook on Jamsocket via a spawn webpage:

```bash
# first, make sure you're logged in to the Jamsocket CLI (send us an email if you need credentials!)
npx jamsocket login

# create a service called jupyter-notebook
npx jamsocket service create jupyter-notebook

# build the jupyter notebook docker image
docker build . -t jupyter-notebook                        # if you're building on an Intel/AMD machine
docker build . -t jupyter-notebook --platform=linux/amd64 # if you're building on Apple Silicon or ARM-based machine

# push the image to the jupyter-notebook service
npx jamsocket push jupyter-notebook jupyter-notebook
```

(Notice: if you are building on an ARM-based processor - like Apple Silicon - you may need to add `--platform=linux/amd64` to the docker build command.)

After building and pushing the jupyter-notebook image to jamsocket, generate a spawn token using the CLI. Jupyter runs on port 8888 by default, so we need to tell Jamsocket to listen on 8888 here.

```bash
npx jamsocket token create jupyter-notebook --port 8888
```

Take the returned token and replace `[SPAWN TOKEN HERE]` in `spawn.html`.

Try it out locally by opening `spawn.html` in your browser:

```bash
open spawn.html
```

## Jamsocket Guide

For more information about the Jamsocket platform, check out our [Early User Guide](https://drifting.notion.site/Jamsocket-early-user-guide-5148f81e34744e77bc6b8b305eb3ea75).

## Customization

Place whatever notebook code you'd like to run in the `notebook` directory, and add any pip-installable dependencies to `requirements.txt`.

By default, the notebook should run on port 8888, so you need to pass a `--port` flag to the `jamsocket spawn` or `jamsocket token create` command to run on that port. (By default, Jamsocket listens on port 8080.)

Provide a password as the `JAMSOCKET_JUPYTER_TOKEN` environment variable. This is the password the jupyter notebook server will expect the user to input through the UI when first accessing the notebook.

## To spawn the jupyter-notebook from the cli:

```bash
npx jamsocket spawn jupyter-notebook --port 8888 --env '{"JAMSOCKET_JUPYTER_TOKEN":"[SET JUPYTER PASSWORD HERE]"}'
```

## To run the jupyter-notebook locally:

```bash
docker run -p 8888:8888 --env JAMSOCKET_JUPYTER_TOKEN=password123 -it jupyter-notebook
open localhost:8888?token=password123
```
