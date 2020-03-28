#!/usr/bin/env bash
#
# @AUTHOR: Luca Leon Happel
# @DATE  : 2020-03-28 Sa 03:09
#
# Display a given txt in all available figlet/toilet fonts
#

[ -z $1 ] \
	&& FONTLOCATION="/usr/share/figlet/" \
	|| FONTLOCATION="$1"

[ -z $2 ] \
	&& STRING="Lorem ipsum." \
	|| STRING="$2"

echo "Displaying fonts in: $FONTLOCATION"

for f in $FONTLOCATION{*.flf,*tlf}
do
	FILENAME="$(basename $f)"
	FILENAME="${FILENAME%.*}"
	echo "    FONT: $f"
	echo "    NAME: $FILENAME"
	hash figlet 2>/dev/null && figlet -f "$f" "$STRING"
	hash toilet 2>/dev/null && toilet -f "$FILENAME" "$STRING"
done
