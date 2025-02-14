FROM docker:latest  

WORKDIR /app

RUN apk add --no-cache git bash

RUN git clone https://github.com/sbm895/dockerBenchmark.git /app/codes

COPY run_benchmark.sh /app/run_benchmark.sh
RUN chmod +x /app/run_benchmark.sh

CMD ["/bin/bash", "/app/run_benchmark.sh"]
