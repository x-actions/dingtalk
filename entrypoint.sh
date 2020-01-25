#!/bin/bash
set -e

DINGTALK_ACCESS_TOKEN=${DINGTALK_ACCESS_TOKEN:-}
DINGTALK_SECRET=${DINGTALK_SECRET:-}
MSGTYPE=${MSGTYPE:-"markdown"}
TEXT=${TEXT:-}

echo "## Sending message ##################"

dingtalk -accessToken "${DINGTALK_ACCESS_TOKEN}" -secret "${DINGTALK_SECRET}" -msgtype "${MSGTYPE}" -text "${TEXT}"

echo "## Done. ##################"
