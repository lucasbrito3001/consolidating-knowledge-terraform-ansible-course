FROM python:3.13.0b2-alpine3.20

WORKDIR /app

RUN apk add curl bash sudo

COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt

COPY . .

HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=3 CMD [ "curl "http://localhost:$PORT/healthz" ]

ENV FLASK_APP=main.py
ENV PORT=5000

CMD sh -c "flask run --host 0.0.0.0 -p $PORT"