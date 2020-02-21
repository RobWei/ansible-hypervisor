#!/bin/bash

IFS=$'\n'
echo -e "\e[95m []============= BIRD-Status =============[]"
echo -e " \e[96m IPv4:\e[39m"
for session in $(birdc -r s p | grep BGP | tr -s " " | sort)
do
        IFS=', ' read -r -a array <<< "$session"
        if [ "${array[5]}" = "Established" ]
        then
                printf "%20s " ${array[0]} ; echo -ne "\e[92m${array[5]}\e[39m\n"
        else
                if [ -n ${array[5]} ]
                then
                        printf "%20s " ${array[0]} ; echo -ne "\e[91m\e[5mDOWN\e[25m\e[39m\n"
                else
                        printf "%20s " ${array[0]} ; echo -ne "\e[91m\e[5m${array[5]}\e[25m\e[39m\n"
                fi
        fi
done
echo -e " \e[96m IPv6:\e[39m"
for session in $(birdc6 -r s p | grep BGP | tr -s " " | sort)
do
        IFS=', ' read -r -a array <<< "$session"
        if [ "${array[5]}" = "Established" ]
        then
                printf "%20s " ${array[0]} ; echo -ne "\e[92m${array[5]}\e[39m\n"
        else
                if [ -v ${array[5]} ]
                then
                        printf "%20s " ${array[0]} ; echo -ne "\e[91m\e[5mDOWN\e[25m\e[39m\n"
                else
                        printf "%20s " ${array[0]} ; echo -ne "\e[91m\e[5mDOWN - ${array[5]}\e[25m\e[39m\n"
                fi
        fi
done
echo -e "\e[95m []=======================================[]\e[39m"
#by RobWei
