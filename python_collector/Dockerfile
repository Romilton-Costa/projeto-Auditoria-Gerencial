FROM python:3.12

WORKDIR /collector

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY . .

CMD ["python","collector.py"]