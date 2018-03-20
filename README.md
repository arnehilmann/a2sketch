# a2sketch
convert asciiart to handwritten sketches

```render_a2sketch
      .------------------.
      |             .-.  |
      |  a2sketch   '-'  |
      |                  |
      '---------------'--'
https://github.com/arnehilmann

```

![sketch](examples/logo-sketch.svg)


## tl;dr

```
docker pull arne/a2sketch
docker run -it -p 22357:22357 arne/a2sketch:0.2
curl -s -H "Content-Type: text/plain" --data-binary "tadahh ---'-" http://localhost:22753/a2sketch -o sketch.svg
open sketch.svg
```
