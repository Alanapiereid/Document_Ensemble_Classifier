FROM python:3.7.7-slim-buster

RUN apt-get update \
&& apt-get install gcc -y \
&& apt-get install g++ -y \
&& apt-get install git -y \
&& apt-get clean

RUN python -m pip install --upgrade pip

WORKDIR /app

COPY requirements.txt /
RUN pip install -r /requirements.txt

RUN python -c "import nltk;nltk.download('punkt')"
RUN python -c "import nltk;nltk.download('stopwords')"

COPY . /app

RUN chmod +x /app/entrypoint.sh
EXPOSE 80
CMD ["/app/entrypoint.sh"]
