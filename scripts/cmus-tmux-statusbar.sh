#!/bin/bash

# init
MAX_TITLE_WIDTH=60
CURTAG_FILE="/tmp/cur-status-tag"
WHOSE=""

# if we don't have a file, start at zero
if [ ! -f "$CURTAG_FILE" ] ; then
    TAG_INDEX=0
else
    # otherwise read the TAG_INDEX from the file
    TAG_INDEX=`cat $CURTAG_FILE`
fi

# increment the TAG_INDEX
TAG_INDEX=`expr ${TAG_INDEX} + 2`
# reset
if [ $TAG_INDEX -ge 59 ]; then
    TAG_INDEX=1
fi

# and save it for next time
echo "${TAG_INDEX}" > "$CURTAG_FILE"

# check if cmus is playing
if cmus-remote -Q > /dev/null 2> /dev/null; then
    CMUS_STATUS=`cmus-remote -Q`
    STATUS=$(echo "$CMUS_STATUS" | grep status | head -n 1 | cut -d' ' -f2-)
    if [ "$STATUS" == "playing" ]; then
        WHOSE="CMUS"
    fi
fi

if [ "$WHOSE" == "CMUS" ]; then
    CMUS_STATUS=`cmus-remote -Q`
    STATUS=$(echo "$CMUS_STATUS" | grep status | head -n 1 | cut -d' ' -f2-)
    ARTIST=$(echo "$CMUS_STATUS" | grep 'tag artist' | head -n 1 | cut -d' ' -f3-)
    TITLE=$(echo "$CMUS_STATUS" | grep 'tag title' | cut -d' ' -f3-)
    COMPOSER=$(echo "$CMUS_STATUS" | grep 'tag composer' | cut -d' ' -f3-)

    if [ -n "$TITLE" ]; then
        if [ $TAG_INDEX -le 19 ] && [ $TAG_INDEX -ge 0 ]; then
            OUTPUT="$ARTIST"

        elif [ $TAG_INDEX -le 39 ] && [ $TAG_INDEX -ge 20 ]; then
            OUTPUT="$COMPOSER"

        elif [ $TAG_INDEX -le 59 ] && [ $TAG_INDEX -ge 40 ]; then
            OUTPUT="$TITLE"
        fi
    fi
fi

# Char width fitting
MARGIN=`expr $MAX_TITLE_WIDTH - ${#OUTPUT}`
if [ $MARGIN -ge 1 ]; then
    PAD=""
    while [ ${#PAD} -lt $MARGIN ]; do
        PAD="$PAD "
    done

    OUTPUT="$PAD$OUTPUT"
else
    OUTPUT=${OUTPUT:0:$MAX_TITLE_WIDTH}
fi

echo $OUTPUT
