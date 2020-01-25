package main

import (
	"flag"
	"fmt"
	"os"

	"dingtalk/robot"
)

var msgtype string
var accessToken string
var secret string
var title string
var text string

var atMobiles string
var isAtAll bool

var picUrl string
var messageUrl string

func init() {
	flag.StringVar(&msgtype, "msgtype", "text", "message type (text, link, markdown, actionCard, feedCard)")
	flag.StringVar(&accessToken, "accessToken", "" ,"robot webhook access token")
	flag.StringVar(&secret, "secret", "" ,"robot webhook secret")
	flag.StringVar(&title, "title", "This is a title", "title of message")
	flag.StringVar(&text, "text", "This is a text", "text of message")

	flag.StringVar(&atMobiles, "atMobiles", "", "phones nums, like: phone1,phone2")
	flag.BoolVar(&isAtAll, "isAtAll", false, "is at all")

	flag.StringVar(&picUrl, "picUrl", "", "Message Picture Url")
	flag.StringVar(&messageUrl, "messageUrl", "", "Message Url")

	flag.Parse()
}

func usage() {
	flag.Usage()
	os.Exit(-1)
}

func main() {
	if len(os.Args) < 2 {
		usage()
	}
    var err error

	webhook := "https://oapi.dingtalk.com/robot/send?access_token=" + accessToken
	r := robot.NewRobot(webhook)
	if secret != "" {
		r.SetSecret(secret)
	}

	switch msgtype {
	case "text":
		content := text
		err = r.SendText(content, []string{atMobiles}, isAtAll)
	case "link":
		err = r.SendLink(title, text, messageUrl, picUrl)
	case "markdown":
		err = r.SendMarkdown(title, text, []string{atMobiles}, isAtAll)
	case "actionCard":
	case "feedCard":
	}
	if err != nil {
		fmt.Println("err:", err)
	}
}
