FROM python:3.8-slim-buster

RUN apt-get update && apt-get install -y git python3-dev gcc \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .

RUN pip install --upgrade -r requirements.txt

WORKDIR /app

COPY . .

RUN python server.py

EXPOSE 5000

CMD ["python", "app/server.py", "serve"]
