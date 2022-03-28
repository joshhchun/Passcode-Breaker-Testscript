#!/bin/bash
mkdir -p testing_script

TEST="testing_script/in_script_text.txt"
OUT="testing_script/out.txt"
MYPROG=''
TESTPROG=''

for i in $(seq 15); do
    ./test.py > $OUT 
    cat out.txt | tail -n 9 > $TEST
    TESTPROG=$(cat out.txt | head -n 1)
    MYPROG=$(./exe/PC07 $TEST | tail -n 1)

    echo "$MYPROG"; echo "$TESTPROG"
    if [[ "$MYPROG" == "$TESTPROG" ]]; then
        echo -e "CORRECT!\n"
    else 
        echo -e "oops incorrect...\n" 
    fi
    NUM=$NUM-1
done

rm -r testing_script
