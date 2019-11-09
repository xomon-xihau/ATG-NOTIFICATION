#!/usr/bin/env fish
while true
    set OLDCHAP (cat $HOME/.oldchap)
    set NEWCHAP (curl -s 'http://book.zongheng.com/book/408586.html' | grep -oP '第.*章.*(?<=/a)')
    if test $NEWCHAP != $OLDCHAP
        notify-send 'Raw is out'
        notify-send $NEWCHAP
        echo $NEWCHAP > $HOME/.oldchap
    end
    sleep 100
end
