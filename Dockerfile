FROM alpine:3.10
RUN apk -v --no-cache --update add \
        musl-dev \
        gcc \
        python3 \
        python3-dev
RUN python3 -m ensurepip --upgrade \
        && pip3 install --upgrade pip
RUN pip3 install --upgrade awscli aws-sam-cli
RUN pip3 uninstall --yes pip \
        && apk del python3-dev gcc musl-dev

RUN apt install -y curl
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - 
RUN apt install -y nodejs
        
COPY entrypoint.sh /entrypoint.sh
RUN ["chmod", "+x", "/entrypoint.sh"]

ENTRYPOINT ["/entrypoint.sh"]
