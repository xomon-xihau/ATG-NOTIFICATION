#!/usr/bin/env fish
set FILE $HOME/.oldchap
if not test -f $FILE
    touch $HOME/.oldchap
end
if not type --quiet 'curl'
    echo 'Plz install curl'
    exit 1
end
while true
    set OLDCHAP (cat $FILE)
    set NEWCHAP (curl -s 'http://book.zongheng.com/book/408586.html' | grep -oP '第.*章.*(?<=/a)')
    if test $NEWCHAP != $OLDCHAP
        notify-send 'Raw is out'
        notify-send $NEWCHAP
        echo $NEWCHAP > $FILE
    end
    sleep 100
end
