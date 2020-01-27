# create by xiexianbin, Github Action for Dingtalk Notification
FROM alpine:latest

# Dockerfile build cache 
ENV REFRESHED_AT 2020-01-11

LABEL "com.github.actions.name"="Github Action for Dingtalk Notification"
LABEL "com.github.actions.description"="Github Action for Dingtalk Notification."
LABEL "com.github.actions.icon"="home"
LABEL "com.github.actions.color"="green"
LABEL "repository"="http://github.com/xiexianbin/dingtalk"
LABEL "homepage"="http://github.com/xiexianbin/dingtalk"
LABEL "maintainer"="xiexianbin<me@xiexianbin.cn>"

LABEL "Name"="Github Action for Dingtalk Notification"
LABEL "Version"="1.0.0"

ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

RUN apk update && apk add --no-cache git bash go && rm -rf /var/cache/apk/*

RUN export GOPATH=`pwd` && \
    mkdir src && \
    cd src && \
    git clone https://github.com/x-actions/dingtalk.git && \
    mv dingtalk dingtalk.bak && \
    cp -rp dingtalk.bak/src/dingtalk . && \
    rm -rf dingtalk.bak && \
    cd dingtalk && \
    # GOOS=linux GOARCH=amd64 go build -tags netgo && \
    go build && \
    cp dingtalk /usr/local/bin

ADD entrypoint.sh /
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
