FROM docker:latest  

WORKDIR /app

RUN apk add --no-cache git

RUN git clone https://github.com/sbm895/dockerBenchmark.git /app/codes

WORKDIR /app/codes

RUN chmod +x run.sh

CMD ["./run.sh"]
