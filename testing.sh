#!/bin/bash
mkdir -p testing_script

TEST="testing_script/in_script_text.txt"
OUT="testing_script/out.txt"
MYPROG=''
TESTPROG=''

echo -e "Downlading python program ... \n"
wget https://raw.githubusercontent.com/joshhchun/Passcode-Breaker-Testscript/main/test.py -q -O ./testing_script/test.py > /dev/null


for i in $(seq 15); do
    ./testing_script/test.py > $OUT 
    cat out.txt | tail -n 9 > $TEST
    TESTPROG=$(cat out.txt | head -n 1)
    MYPROG=$(./exe/PC07 $TEST)

    echo "$MYPROG"; echo "$TESTPROG"
    if [[ "$MYPROG" == "$TESTPROG" ]]; then
        echo -e "CORRECT!\n"
    else 
        echo -e "oops incorrect...\n" 
    fi
    NUM=$NUM-1
done

rm -r testing_script

