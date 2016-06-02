FILE=$(mktemp --suffix=".png")
escrotum -s $FILE --exec "puush $FILE | grep 'http' | xclip -selection clipboard && notify-send Uploaded -a Puush -t 1500"
rm $FILE
