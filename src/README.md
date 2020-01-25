# dingtalk client

fork from https://github.com/royeo/dingrobot

## Build

```
export GOPATH=`pwd`
go get github.com/x-actions/dingtalk/src/dingtalk
```

or

```
cd dingtalk/
GOOS=linux GOARCH=amd64 go build -tags netgo
```

## Usage

```
./dingtalk -accessToken <accessToken> -secret <secret> -msgtype markdown -title "Github Action Noti" -text "Build Done."
```
