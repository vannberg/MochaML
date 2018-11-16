#!/bin/bash/
#Fredrik O. Vannberg, vannberg@gatech.edu, vannberg@gmail.com
#Georgia Institute of Technology
#Recommend chmod +x dataflow.sh, ./dataflow.sh <search term 1> <optional search term 2> i.e. ./dataflow.sh metagenomics git
mkdir MochaML
cd MochaML
curl -o ./googler https://raw.githubusercontent.com/jarun/googler/v3.7.1/googler
python3 googler --np -n 100 -C $1 $2 > out.txt
grep "^https://github.com" out.txt > out_git.txt
cat out_git.txt | while read line; do GIT_TERMINAL_PROMPT=0 git clone $line; done
rm out.txt
rm out_git.txt
echo "MochaML complete"
