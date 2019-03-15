# HexGraphics
Convert Hex game in sgf to pdf

## What is SGF? 
[Smart Game Format](https://en.wikipedia.org/wiki/Smart_Game_Format) supports various games including Hex; the following is an example game: 
```
(;AP[HexGui:0.9.GIT]FF[4]GM[11]SZ[11];B[a9];W[b10];B[f7];W[f6];B[h5];
W[h4];B[g5];W[g4];B[f5];W[f4];B[i4];W[i3];B[d5];W[e5];B[d6];W[d9];B[e6];
W[d4];B[e4];W[f2];B[e3];W[e2];B[k2];W[j3];B[f3];W[g2];B[g3];W[h2];B[i2];
W[f8];B[e8];W[e9];B[h7];W[i8];B[c10];W[c9])
```
Hex sgf can be viewed/edited using [HexGUI](https://github.com/cgao3/hexgui). 

## SGF to pdf
Procedure 
+ sgf to plain points, using `sgf2p.py`
+ plain points to hex-diagram, using `plain2hd`
+ hex-digram to eps, using `make10.pl`
+ eps to pdf, using `epstopdf --pdfsettings=screen input.eps`

### An automatic script 
A script is provied, usage 
```sh
./convert.sh games/ 
```
where `games/` is the path to the directory that Hex sgfs are located. 
