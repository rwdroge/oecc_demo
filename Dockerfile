FROM ubuntu:20.04

USER 0
#docker-compose-wait to have the container wait for the mongodb to be available
#https://github.com/ufoscout/docker-compose-wait
RUN mkdir /home/oecc_server && \
    mkdir /home/oecc_data && \
    mkdir /home/oecc_server/conf && \
    mkdir /home/oecc_data/conf

COPY --from=ghcr.io/ufoscout/docker-compose-wait:latest /wait /wait
ADD ./binaries/PROGRESS_OECC_SERVER_1.3.0_LNX_64.tar.gz startoecc_server.sh /home/oecc_server/

COPY config/data/*.json  /home/oecc_data/conf
COPY config/server/*.json /home/oecc_server/conf

WORKDIR /home/oecc_server

CMD /wait && /home/oecc_server/startoecc_server.sh

EXPOSE 8050