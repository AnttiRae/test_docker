FROM python:3.11

WORKDIR /app

RUN apt-get update && apt-get install -y \
    build-essential \
    python3-dev

COPY . .

RUN python -m pip install -r requirements.txt

CMD ["uwsgi", "--http", "127.0.0.1:8000", "--master", "-p", "4", "-w", "web:app"]