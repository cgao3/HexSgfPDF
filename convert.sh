#!/bin/bash

if [ $# -lt 1 ] ; then
    echo "Usage: $0 path_to_sgf_game_dir "
    exit 1
fi 
sgf_game_dir=$1
if [ ! -d $sgf_game_dir ]; then 
    echo "$sgf_game_dir not exists!"
    exit 1
fi
plain2hd="./plain2hd"
if [ ! -f $plain2hd ]; then 
    echo "$plain2hd not exists, will make"
    make 
fi

chmod +x sgf2p.py
chmod +x make10.pl 
for file in "$sgf_game_dir"/*.sgf 
do 
    SZ=`cat $file | egrep -o 'SZ\[\d+\]' | cut -c4-6 | cut -d']' -f 1`
    ./sgf2p.py < $file | $plain2hd $SZ > "${file%.sgf}.hexdiag" ; 
done

cp make10.pl "$sgf_game_dir"/
cp template10.master.ps "$sgf_game_dir"/

cd $sgf_game_dir

./make10.pl

wait 

for file in *.eps 
do 
  epstopdf --pdfsettings=screen $file 
done

# clean up
rm *.hexdiag
rm make10.pl
rm template10.master.ps
rm *.eps

# go back
cd - 
