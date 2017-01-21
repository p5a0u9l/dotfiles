#!/bin/bash

# init
MAX_TITLE_WIDTH=70
CURTAG_FILE="/tmp/cur-status-tag"
WHOSE=""

# if we don't have a file, start at zero
if [ ! -f "$CURTAG_FILE" ] ; then
    INDEX=0
else
    # otherwise read the INDEX from the file
    INDEX=`cat $CURTAG_FILE`
fi

# increment the INDEX
INDEX=`expr ${INDEX} + 3`

# and save it for next time
echo "${INDEX}" > "$CURTAG_FILE"

# check if cmus is playing
if cmus-remote -Q > /dev/null 2> /dev/null; then
    CMUS_STATUS=`cmus-remote -Q`
    STATUS=$(echo "$CMUS_STATUS" | grep status | head -n 1 | cut -d' ' -f2-)
    if [ "$STATUS" = "playing" ]; then
        WHOSE=1
    fi
fi

if [ "$WHOSE" -eq 1 ]; then
    CMUS_STATUS=`cmus-remote -Q`
    STATUS=$(echo "$CMUS_STATUS" | grep status | head -n 1 | cut -d' ' -f2-)
    ARTIST=$(echo "$CMUS_STATUS" | grep 'tag artist' | head -n 1 | cut -d' ' -f3-)
    ALARTIST=$(echo "$CMUS_STATUS" | grep 'tag albumartist' | head -n 1 | cut -d' ' -f3-)
    TITLE=$(echo "$CMUS_STATUS" | grep 'tag title' | cut -d' ' -f3-)
    COMPOSER=$(echo "$CMUS_STATUS" | grep 'tag composer' | cut -d' ' -f3-)
    OUTPUT="$COMPOSER, $ARTIST, $TITLE"
fi

output_length=${#OUTPUT}
i0=$INDEX

if [ $output_length -gt $MAX_TITLE_WIDTH ]; then
    i1=`expr $i0 + $MAX_TITLE_WIDTH`
    if [ $i1 -gt $output_length ]; then
        i1=$output_length
        partA=${OUTPUT[@]:$i0-1:$i1},
        partB=${OUTPUT[@]:0:${#partA}}
    else
        partA=${OUTPUT[@]:$i0-1:$i1}
        partB=""
    fi
else
    partA=$OUTPUT
    partB=""
fi

# echo "$i0, $i1, $output_length"
MARQUEE="$partA $partB"
echo $MARQUEE

# Char width fitting
# reset
if [ $INDEX -ge $output_length ]; then
    INDEX=1
fi

# and save it for next time
echo "${INDEX}" > "$CURTAG_FILE"

