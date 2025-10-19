FROM gcc:12-bullseye

WORKDIR /app

COPY Makefile .
COPY hello.c .
COPY lib/ ./lib/
COPY include/ ./include/

RUN make

CMD ["./hello"]