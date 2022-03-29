#!/bin/bash
mkdir -p testing_script

TEST="./testing_script/in_script_text.txt"
OUT="./testing_script/out.txt"
MYPROG=''
TESTPROG=''
SCORE=0

echo -e "Downlading python program ... \n"
wget https://raw.githubusercontent.com/joshhchun/Passcode-Breaker-Testscript/main/test.py -q -O ./testing_script/test.py > /dev/null
chmod +x ./testing_script/test.py

for i in $(seq 15); do
    ./testing_script/test.py > $OUT 
    cat $OUT | tail -n+2 > $TEST
    TESTPROG=$(cat $OUT | head -n 1)
    MYPROG=$(./exe/PC07 $TEST)

     echo "Your program cracked password: $MYPROG"
     echo "Correct cracked password: $TESTPROG"
    if [[ "$MYPROG" == "$TESTPROG" ]]; then
        echo -e "CORRECT!\n"
        SCORE=$(($SCORE+1))
    else 
        echo -e "oops incorrect...\n" 
    fi
done

echo "Total Score: $SCORE / 15 = $(($SCORE / 15 * 100))%"

rm -r testing_script
