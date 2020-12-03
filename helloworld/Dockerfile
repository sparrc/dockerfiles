FROM public.ecr.aws/bitnami/golang:1.15.5 as build
RUN install_packages upx
ADD . /
RUN go build -o /helloworld -ldflags="-s -w" /helloworld.go
RUN upx --brute /helloworld

FROM scratch
COPY --from=build /helloworld /helloworld
CMD ["/helloworld"]
