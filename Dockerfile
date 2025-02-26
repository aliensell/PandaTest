FROM python:3.9-slim
WORKDIR /app
COPY httpserver.py /app/
EXPOSE 8888
CMD ["python", "httpserver.py"]
