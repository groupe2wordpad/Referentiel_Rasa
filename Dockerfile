FROM rasa/rasa:3.6.8

WORKDIR /app

COPY . /app

USER root
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

EXPOSE 5005

USER 1001

CMD ["run", "--enable-api", "--cors", "*", "--debug", "--port", "5005"]
