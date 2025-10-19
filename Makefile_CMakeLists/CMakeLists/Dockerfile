FROM gcc:12-bullseye

RUN apt-get update && apt-get install -y cmake && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY CMakeLists.txt .
COPY hello.c .
COPY lib/ ./lib/
COPY include/ ./include/

RUN cmake . && make

CMD ["./bin/hello"]