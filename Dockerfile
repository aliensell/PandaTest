#FROM python:3.9-slim
FROM python:3.12-alpine
WORKDIR /app
COPY httpserver.py /app/
EXPOSE 8888
CMD ["python", "httpserver.py"]
