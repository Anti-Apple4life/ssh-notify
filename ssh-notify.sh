#!/bin/bash

# We want to trigger the script only when the SSH session starts.
# To be notified also when session closes, you can watch for
# the "close_session" value.
if [[ "$PAM_TYPE" != "open_session" ]]; then
        exit 0
fi
# If you would like to only trigger the script when someone else logs in with a different username,
# replace YOUR_USERNAME with your username on Linux
if [[ "$PAM_USER" == "YOUR_USERNAME" ]]; then
        exit 0
fi

Env:
$(printenv)
EOF

curl -s \
  --form-string "token=YOUR_PUSHOVER_APP_TOKEN" \
  --form-string "user=YOUR_PUSHOVER_USER_TOKEN" \
  --form-string "message=User $PAM_USER logged in via SSH" \
  --form-string "title=sshAlert" \
  https://api.pushover.net/1/messages.json
