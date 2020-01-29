# dingtalk client

fork from https://github.com/royeo/dingrobot

## Build

```
git clone https://github.com/x-actions/dingtalk.git
cd dingtalk
export GOPATH=`pwd`
cd src/dingtalk/
GOOS=linux GOARCH=amd64 go build -tags netgo
```

## Usage

```
./dingtalk -accessToken <accessToken> -secret <secret> -msgtype markdown -title "Github Action Noti" -text "Build Done."
```
