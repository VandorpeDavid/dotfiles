FILE=$(mktemp --suffix=".png")
escrotum -s $FILE --exec "puush $FILE | grep 'http' | xclip -selection clipboard"
rm $FILE
