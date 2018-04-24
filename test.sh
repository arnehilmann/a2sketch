#!/bin/bash
set -e -E -u -o pipefail -C

SOURCE=${1:-examples/logo-sketch.a2s}
HOST=${2:-http://localhost:22753}
OUT=${3:-out}

BASENAME=$(basename $SOURCE .a2s)
SVG0=$OUT/$BASENAME.0.svg
SVG1=$OUT/$BASENAME.1.svg
INDEX=$OUT/index.html

rm -rf $OUT/* && mkdir -p $OUT
curl -s -S --data "$(cat $SOURCE)" -o $SVG0 $HOST/a2svg
curl -s -S --data "$(cat $SVG0)" -o $SVG1 "$HOST/s2sketch?id=foo&hideFilledPathes=true"

cp vivus*.js *.ttf $OUT/

exec 3>&1 1>$INDEX
echo "<html><head><style>svg {border: 1pt solid black; vertical-align: top;}</style></head><body>"
# echo "<pre>$(cat $SOURCE)</pre>" >> $INDEX
for F in $OUT/*.svg; do
    cat $F
done
echo "<script src='vivus.min.js'></script>"
echo "<script src='vivus-helper.js'></script>"
echo "<script>new Vivus('foo', {type: 'oneByOne', duration: 200}, displayAll(200));</script>"
echo "</body></html>"
exec 1>&3


echo "done."
