# Github Action for Dingtalk Notification

![](https://github.com/x-actions/dingtalk/workflows/dingtalk/badge.svg)

Github Action for Sending Dingtalk robot messages.

## Environment Variables

- DINGTALK_ACCESS_TOKEN: dingtalk access token
- DINGTALK_SECRET: dingtalk secret

## How to Use

```
    - name: Sending Dingtalk Message
      uses: x-actions/dingtalk@master
      env:
        DINGTALK_ACCESS_TOKEN: ${{ secrets.DINGTALK_ACCESS_TOKEN }}
        DINGTALK_SECRET: ${{ secrets.DINGTALK_SECRET }}
        MSGTYPE: markdown
        TEXT: |
          # Noti
          > Build Github Action Done.
          > ^_^
```

## Options

```
Usage of ./dingtalk:
  -accessToken string
    	robot webhook access token
  -atMobiles string
    	phones nums, like: phone1,phone2
  -isAtAll
    	is at all
  -messageUrl string
    	Message Url
  -msgtype string
    	message type (text, link, markdown, actionCard, feedCard) (default "text")
  -picUrl string
    	Message Picture Url
  -secret string
    	robot webhook secret
  -text string
    	text of message (default "This is a text")
  -title string
    	title of message (default "This is a title")
```

## Dingtalk Doc

- https://ding-doc.dingtalk.com/doc#/serverapi2/qf2nxq
