# a2sketch

convert asciiart to handwritten sketches

```render_a2sketch
     #-------------------.
     |[0]                |
     | .---# .---# #---. |
     | |[1]| |[2]| |[3]| |
     | #-+-' #-+-' '-+-# |
     |   ^     ^     ^   |
     #---+-----+--=--+---#
     |[4]|     |     |   |
     |   a     2  sketch |
     '-------------------#
 github.com/arnehilmann/a2sketch

[0]: {"fill": "#933", "a2s:delref": true, "fillStyle": "solid"}
[1]: {"fill": "#bbb", "a2s:delref": true, "fillStyle": "solid"}
[2]: {"fill": "#bbb", "a2s:delref": true, "fillStyle": "solid"}
[3]: {"fill": "#bbb", "a2s:delref": true, "fillStyle": "solid"}
[4]: {"fill": "#ddd", "a2s:delref": true}
```
![sketch](examples/logo-sketch.svg)


## tl;dr

```
docker pull arne/a2sketch:0.5
docker run -it -p 22357:22357 arne/a2sketch:0.5
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
