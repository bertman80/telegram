#!/bin/bash
# telegram basic send module
# this script just send 
# location file: 
#     sudo cp telegram_send /usr/bin/telegram-send
#     sudo chmod +x /usr/bin/telegram-send
# Group_id is number from the reveived user or group
# Bot_token is number you get when telegramuser is created

GROUP_ID=<GROUP_ID> 
BOT_TOKEN=<BOT_TOKEN>

# this 3 checks (if) are not necessary but should be convenient
if [ "$1" == "-h" ]; then
  # Help
  echo ""
  echo "Help `basename $0`"
  echo "Usage: `basename $0` \"text message\""
  echo ""
  exit 0
fi

if [ -z "$1" ]
  then
    # Missing text
    echo ""
    echo "Error: Missing argument"
    echo "Usage: `basename $0` \"text message\""
    echo ""
    exit 0
fi

if [ "$#" -ne 1 ]; then
    # Multiple arguments
    echo ""
    echo "Error: One argument allowed."
    echo "Usage: `basename $0` \"text message\""
    echo ""
    exit 0
fi

curl -s --data "text=$1" --data "chat_id=$GROUP_ID" 'https://api.telegram.org/bot'$BOT_TOKEN'/sendMessage' > /dev/null
