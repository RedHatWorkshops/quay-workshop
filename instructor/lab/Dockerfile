FROM hashicorp/terraform:light
MAINTAINER "CoreOS Training Team <training@coreos.com>"

COPY terraform /opt/training
RUN apk add --no-cache --upgrade putty zip make

WORKDIR /opt/training
ENTRYPOINT ["make"]
CMD ["--version"]
