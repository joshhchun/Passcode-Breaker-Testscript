#!/bin/bash
mkdir -p testing_script

TEST="./testing_script/in_script_text.txt"
OUT="./testing_script/out.txt"
MYPROG=''
TESTPROG=''
SCORE=0

echo -e "Downloading python program ... \n"
wget https://github.com/joshhchun/Passcode-Breaker-Testscript/blob/main/test_no_space.zip?raw=true -q -O ./testing_script/test.zip > /dev/null
echo '#!/usr/bin/env python3' > testing_script/TEST_PC07
chmod +x testing_script/TEST_PC07
cat testing_script/test.zip >> testing_script/TEST_PC07

for i in $(seq 15); do
    ./testing_script/TEST_PC07 > $OUT 
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
