import sys
import os
import re

if len(sys.argv)<2:
    print("Usage: python {} hex_sgf_file ".format(__file__)) 
    print("Support sgf Hex games saved by HexGui")
    sys.exit(1)

def strip_move(raw_move):
    return raw_move[2:].replace(']','')

def print_tex_source(has_swap, move_list, boardsize):    
    first_move_label='S' if has_swap else '1'
    boardsize=repr(boardsize)
    moves=','.join(map(strip_move, move_list))
    s=r'''\documentclass[convert]{standalone} 
    \usepackage{tikz} 
    \usepackage{havannah}  
    \begin{document} 
    \renewcommand\HCoordinateStyle[1]{\Large #1}
    \renewcommand\HDrawHex{\draw[fill=gray!35]}
    \begin{HexBoard}[board size={'''+boardsize+'''}] 
    \HGame[first move label={'''+first_move_label+'''}, relative stone size=0.99]{'''+moves+'''} 
    \end{HexBoard} 
    \end{document}'''

    print(s)





fname=sys.argv[1]
has_swap=False
with open(fname) as f:
    string_game=f.read()
    has_swap=True if string_game.find('swap') >=0 else False
    move_pattern=r'[W|B]\[[A-Za-z][0-9]+\]'
    sz_pattern=r'SZ\[[0-9]+\]'
    #print(re.findall(move_pattern, string_game))
    #print(re.findall(sz_pattern, string_game))
    #print('has_swap:', has_swap)
    boardsize=int(re.findall(sz_pattern, string_game)[0][3:].replace(']',''))
    #print(boardsize)
    print_tex_source(has_swap, re.findall(move_pattern, string_game), boardsize) 


