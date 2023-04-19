FROM python:3.11.3-slim

RUN useradd -m jupyter
USER jupyter
WORKDIR /home/jupyter

RUN python3 -m venv notebook-env
COPY --chown=jupyter requirements.txt ./
COPY empty.ipynb ./

RUN /home/jupyter/notebook-env/bin/pip install --upgrade pip
#RUN /home/jupyter/notebook-env/bin/pip install nbconvert
RUN /home/jupyter/notebook-env/bin/pip install -r requirements.txt

# Warm up the kernel.
#RUN /home/jupyter/notebook-env/bin/jupyter nbconvert --to markdown --execute empty.ipynb

COPY --chown=jupyter notebook ./notebook
COPY config.sh ./
RUN ./config.sh

RUN /home/jupyter/notebook-env/bin/ipython profile create default

ENV PATH=/home/jupyter/notebook-env/bin:$PATH

WORKDIR /home/jupyter/notebook

ENV PYDEVD_DISABLE_FILE_VALIDATION=1

CMD /home/jupyter/notebook-env/bin/jupyter notebook --ip 0.0.0.0 --port $PORT --no-browser --NotebookApp.token=""
