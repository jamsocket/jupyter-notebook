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

After building and pushing the jupyter-notebook image to jamsocket, generate a spawn token using the CLI.

```bash
npx jamsocket token create jupyter-notebook
```

Take the returned token and replace `[SPAWN TOKEN HERE]` in `spawn.html`.

Try it out locally by opening `spawn.html` in your browser:

```bash
open spawn.html
```

## Jamsocket Guide

For more information about the Jamsocket platform, check out our [docs](https://docs.jamsocket.com/).

## Customization

Place whatever notebook code you'd like to run in the `notebook` directory, and add any pip-installable dependencies to `requirements.txt`.

Provide a password as the `JAMSOCKET_JUPYTER_TOKEN` environment variable. This is the password the jupyter notebook server will expect the user to input through the UI when first accessing the notebook.

## To spawn the jupyter-notebook from the cli:

```bash
npx jamsocket spawn jupyter-notebook --env '{"JAMSOCKET_JUPYTER_TOKEN":"[SET JUPYTER PASSWORD HERE]"}'
```

## To run the jupyter-notebook locally for testing:

```bash
docker run -p 8080:8080 --env JAMSOCKET_JUPYTER_TOKEN=password123 --env PORT=8080 -it jupyter-notebook
open localhost:8080?token=password123
```
