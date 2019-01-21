#!/bin/bash
set -e -E -u -o pipefail -C

HOST=${1:-http://localhost:22753}
OUT=${2:-out}
INDEX=$OUT/index.html

rm -rf $OUT/* && mkdir -p $OUT
cp vivus*.js *.ttf $OUT/
exec 3>&1 1>$INDEX
echo "<html><head><style>svg {border: 1pt solid black; vertical-align: top;}</style></head><body>"

BASENAMES=()
for SOURCE in examples/*.a2s; do
    BASENAME=$(basename $SOURCE .a2s)
    BASENAMES+=($BASENAME)
    SVG0=$OUT/$BASENAME.0.svg
    SVG1=$OUT/$BASENAME.1.svg
    SVG2=$OUT/$BASENAME.2.svg

    curl -s -S --data "$(cat $SOURCE)" -o $SVG0 $HOST/a2svg
    curl -s -S --data "$(cat $SOURCE)" -o $SVG1 "$HOST/a2sketch?id=bar"
    curl -s -S --data "$(cat $SVG0)" -o $SVG2 "$HOST/s2sketch?id=$BASENAME&hideFilledPathes=true"

    for F in $OUT/$BASENAME*.svg; do
        cat $F
    done
    echo "<img src='$BASENAME.1.svg'/>"
    echo "</br>"
done

echo "<script src='vivus.min.js'></script>"
echo "<script src='vivus-helper.js'></script>"
for BASENAME in ${BASENAMES[@]}; do
    echo "<script>new Vivus('$BASENAME', {type: 'oneByOne', duration: 200}, displayAll(200));</script>"
done
echo "</body></html>"
exec 1>&3

echo "done."
