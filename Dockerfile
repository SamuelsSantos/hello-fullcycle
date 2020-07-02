FROM golang:1.14-alpine AS build

WORKDIR /src/
COPY hello-fullcycle.go go.* /src/
RUN CGO_ENABLED=0 go build -o /bin/hello-fullcycle

FROM scratch
COPY --from=build /bin/hello-fullcycle /bin/hello-fullcycle
ENTRYPOINT ["/bin/hello-fullcycle"]