#!/bin/bash

set -e 

if [ $# -lt 1 ] ; then
    echo "Usage: $0 path_to_sgf_game_dir "
    exit 1
fi 
sgf_game_dir=$1
if [ ! -d $sgf_game_dir ]; then 
    echo "$sgf_game_dir not exists!"
    exit 1
fi

chmod +x sgf_to_latex.py
chmod +x latex_to_pdf.sh

cp sgf_to_latex.py  "$sgf_game_dir/"
cp latex_to_pdf.sh "$sgf_game_dir/"


cd $sgf_game_dir

for file in ./*.sgf 
do 
    ./sgf_to_latex.py $file > "${file%.sgf}.tex"
done

./latex_to_pdf.sh 2>&1 >/dev/null

wait 

echo "Done. Please check $sgf_game_dir"
rm sgf_to_latex.py
rm latex_to_pdf.sh
# go back
cd - 
