FROM python:3.13.0b2-alpine3.20

WORKDIR /app

COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt

COPY . .

ENV FLASK_APP=main.py
ENV PORT=5000

RUN addgroup -S appgroup && adduser -S appuser -G appgroup

HEALTHCHECK  --interval=5s --timeout=3s --start-period= --retries=3 CMD wget --no-verbose --tries=1 --spider "http://127.0.0.1:$PORT/healthz" || exit 1

EXPOSE $PORT

USER appuser

CMD sh -c "flask run --host 0.0.0.0 -p $PORT"