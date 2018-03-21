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
docker pull arne/a2sketch:0.3
docker run -it -p 22357:22357 arne/a2sketch:0.3
curl -s --data-binary "-=-=- tadahh -==-" http://localhost:22753/a2sketch -o sketch.svg
open sketch.svg
```


## References

[@docker-hub](https://hub.docker.com/r/arne/a2sketch/)


## Credits

* [asciitosvg](https://github.com/dhobsd/asciitosvg):
  Converting asciiart to crisp svg

* [rough.js](https://github.com/pshihn/rough):
  Simulating shaky handwriting


## License

[MIT License](LICENSE) © [Arne Hilmann](https://github.com/arnehilmann)
