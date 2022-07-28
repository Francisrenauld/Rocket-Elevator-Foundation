SLACK_API = Slack::Notifier.new(
    "https://hooks.slack.com/services/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",
    channel: '#elevator_operators'
)
            #  username: "notifier"



# notifier = Slack::Notifier.new (
#     "https://hooks.slack.com/services/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" do
#     defaults channel: "#elevator_operators",)
#             #  username: "notifier"