# Dockerfile
FROM python:3.11
COPY requirements.txt /frontendapp/requirements.txt
WORKDIR /frontendapp
RUN pip install -r requirements.txt
COPY . /frontendapp
ENTRYPOINT ["python"]
CMD ["run.py"]