#!/bin/zsh

# if [[ $(date '+%H') == 00 ]];then
#     time=$(($RANDOM%10))" 2 * * *"
# elif [[ $(date '+%H') == 02 ]];then
#     time=$(($RANDOM%10))" 5 * * *"
# elif [[ $(date '+%H') == 04 ]];then
#     time=$(($RANDOM%10))" 7 * * *"
# elif [[ $(date '+%H') == 06 ]];then
#     time=$(($RANDOM%10))" 9 * * *"
# elif [[ $(date '+%H') == 08 ]];then
#     time=$(($RANDOM%10))" 11 * * *"
# elif [[ $(date '+%H') == 10 ]];then
#     time=$(($RANDOM%5))" 13 * * *"
# elif [[ $(date '+%H') == 12 ]];then
#     time=$(($RANDOM%10))" 0 * * *"
# else
#     time=$(($RANDOM%10))" 0,2,4,6,8,10,12 * * *"
# fi
if [[ ( $(date '+%H') == 0 ) || ( $(date '+%H') == 02 )  || ( $(date '+%H') == 04 )  || ( $(date '+%H') == 06 )  || ( $(date '+%H') == 08 )  || ( $(date '+%H') == 10 )  || ( $(date '+%H') == 12 ) ]] ;then
    time=$(($RANDOM%10))" 0,2,4,6,8,10,12 * * *"
    echo 当前时间为$(date '+%H')时，计划运行时间$time
    sed -i '/cron:/d' .github/workflows/run.yml
    sed -i '/schedule/a\    - cron: '$time'' .github/workflows/run.yml
    exit 0
else
    exit 0
fi
