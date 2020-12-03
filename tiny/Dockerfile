FROM public.ecr.aws/bitnami/minideb:buster as build
RUN install_packages nasm
ADD . /
RUN nasm -o /tiny /tiny.asm && chmod +x /tiny

FROM scratch
COPY --from=build /tiny /tiny
CMD ["/tiny"]
