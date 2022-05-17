FROM python:latest

COPY requirements.txt ./
RUN pip install -r requirements.txt

RUN useradd -m jupyter
USER jupyter
WORKDIR /home/jupyter

COPY --chown=jupyter notebook ./notebook
COPY run.sh ./

WORKDIR /home/jupyter/notebook

CMD ["../run.sh"]
