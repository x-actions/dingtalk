# create by xiexianbin, Github Action for Dingtalk Notification
FROM alpine:latest

# Dockerfile build cache 
ENV REFRESHED_AT 2020-01-11

LABEL "com.github.actions.name"="Github Action for Dingtalk Notification"
LABEL "com.github.actions.description"="Github Action for Dingtalk Notification."
LABEL "com.github.actions.icon"="home"
LABEL "com.github.actions.color"="green"
LABEL "repository"="http://github.com/x-actions/dingtalk"
LABEL "homepage"="http://github.com/x-actions/dingtalk"
LABEL "maintainer"="xiexianbin<me@xiexianbin.cn>"

LABEL "Name"="Github Action for Dingtalk Notification"
LABEL "Version"="1.0.0"

ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

RUN apk update && apk add --no-cache git bash go dep && rm -rf /var/cache/apk/*

RUN mkdir -p /github/actions && \
    cd /github/actions && \
    git clone https://github.com/x-actions/dingtalk.git && \
    cd dingtalk && \
    export GOPATH=`pwd` && \
    cd src/dingtalk && \
    dep ensure && \
    # GOOS=linux GOARCH=amd64 go build -tags netgo && \
    go build && \
    cp dingtalk /usr/local/bin && \
    cd / && \
    rm -rf /github/actions

ADD entrypoint.sh /
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
