#!/bin/bash
# Mar
#
NOW=$(date -d "now" "+%a %b %d")
# Achtung bei debian $8 , bei SUSE $7
UP=$(last | grep "$NOW" | awk '{print $8 }' | sort | head -n1)
# echo $UP # debug
date1=$(date -d "$UP:00" +%s)
date2=$(date -d "now" +%s)
worktime=32400 # in sec 8h + 1h pause
diff=$(($worktime-($date2-$date1)))
if (( $diff >= 30000))
then
        echo "\\ Viel zu Früh !! \\"
        exit
fi
if (( $diff <= 0))
then
        echo " :) Aufwachen , es ist Feierabend !! "
else
        echo " Noch $(date -u -d @"$diff" +%H" H und "%M" Min")  "
fi
