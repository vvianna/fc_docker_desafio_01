FROM golang:alpine as stage1
WORKDIR /cerocks
RUN go mod init github.com/vvianna/fc_docker_desafio_01
COPY . .
RUN go build
#CMD [ "./fc_docker_desafio_01" ]

FROM scratch
WORKDIR /cerocks
COPY --from=stage1 /cerocks /cerocks
ENTRYPOINT [ "./fc_docker_desafio_01" ]