FROM python:3.10

WORKDIR /usr/src/api

RUN apt-get update && apt-get install -y netcat

COPY pyproject.toml /usr/src/api/pyproject.toml

ENV PYTHONPATH=${PYTHONPATH}:${PWD}

RUN pip install --upgrade pip  &&\
    pip install poetry &&\
    poetry config virtualenvs.create false &&\
    poetry install --no-interaction &&\
    poetry shell

ADD entrypoint.sh /usr/src/app/entrypoint.sh

RUN chmod a+x /usr/src/app/entrypoint.sh

COPY . .

RUN pwd && ls -la

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000",  "--reload"]