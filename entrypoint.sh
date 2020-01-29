#!/bin/bash
set -e

DINGTALK_ACCESS_TOKEN=${DINGTALK_ACCESS_TOKEN:-}
DINGTALK_SECRET=${DINGTALK_SECRET:-}
MSGTYPE=${MSGTYPE:-"markdown"}
TITLE=${TITLE:-}
TEXT=${TEXT:-}

echo "## Sending message ##################"

dingtalk -accessToken "${DINGTALK_ACCESS_TOKEN}" -secret "${DINGTALK_SECRET}" -msgtype "${MSGTYPE}" -title "${TITLE}" -text "${TEXT}"

echo "## Done. ##################"
