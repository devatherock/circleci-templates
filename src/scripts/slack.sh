template=$(cat <<-_EOT_
{
  "text": "$TEXT",
  "channel": "$CHANNEL",
  "color": "$COLOR",
  "title": "$TITLE",
  "webhook": "$SLACK_WEBHOOK",
  "build_id": "$CIRCLE_WORKFLOW_ID"
}
_EOT_
)
curl --location 'https://simple-slack.fly.dev/api/notification' \
     --header 'Content-Type: application/json' \
     --data "${template}"