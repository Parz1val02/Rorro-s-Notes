#!/bin/bash
#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

#Catch the sigkill signal when it is send to end with CTRL-C to kill the program
trap ctrl_c INT
function ctrl_c(){
	echo -e "\n${redColour}[!] Exiting program...\n${endColour}"
	rm ut.* 2>/dev/null
	tput cnorm; exit 1
}

#Help function when the program has not been executed correctly
function helpPanel(){
	echo -e "\n${redColour}[!] Usage: $0${endColour}\n"
	for i in $(seq 1 80); do echo -ne "${redColour}-"; done; echo -ne "${endColour}"
	echo -e "\n\n${grayColour}[-e]${endColour}${yellowColour} Exploration mode${endColour}"
	echo -e "\t${purpleColour}unconfirmed_transactions${endColour}${yellowColour}:\t List unconfirmed transactions${endColour}"
	echo -e "${grayColour}[-n]${endColour}${yellowColour}:Limit the number of results${endColour}${blueColour} (Example: -n 10)${endColour}\n"
	echo -e "${grayColour}[-h]${endColour}${yellowColour}:Invoke this help panel${endColour}\n"
	tput cnorm; exit 1;
}
#Global variables
unconfirmed_transactions="https://www.blockchain.com/explorer/mempool/btc"

#Functions to dynamically create tables
printTable(){

    local -r delimiter="${1}"
    local -r data="$(removeEmptyLines "${2}")"

    if [[ "${delimiter}" != '' && "$(isEmptyString "${data}")" = 'false' ]]
    then
        local -r numberOfLines="$(wc -l <<< "${data}")"

        if [[ "${numberOfLines}" -gt '0' ]]
        then
            local table=''
            local i=1

            for ((i = 1; i <= "${numberOfLines}"; i = i + 1))
            do
                local line=''
                line="$(sed "${i}q;d" <<< "${data}")"

                local numberOfColumns='0'
                numberOfColumns="$(awk -F "${delimiter}" '{print NF}' <<< "${line}")"

                if [[ "${i}" -eq '1' ]]
                then
                    table="${table}$(printf '%s#+' "$(repeatString '#+' "${numberOfColumns}")")"
                fi

                table="${table}\n"

                local j=1

                for ((j = 1; j <= "${numberOfColumns}"; j = j + 1))
                do
                    table="${table}$(printf '#| %s' "$(cut -d "${delimiter}" -f "${j}" <<< "${line}")")"
                done

                table="${table}#|\n"

                if [[ "${i}" -eq '1' ]] || [[ "${numberOfLines}" -gt '1' && "${i}" -eq "${numberOfLines}" ]]
                then
                    table="${table}$(printf '%s#+' "$(repeatString '#+' "${numberOfColumns}")")"
                fi
            done

            if [[ "$(isEmptyString "${table}")" = 'false' ]]
            then
                echo -e "${table}" | column -s '#' -t | awk '/^\+/{gsub(" ", "-", $0)}1'
            fi
        fi
    fi
}

function removeEmptyLines(){

    local -r content="${1}"
    echo -e "${content}" | sed '/^\s*$/d'
}

function repeatString(){

    local -r string="${1}"
    local -r numberToRepeat="${2}"

    if [[ "${string}" != '' && "${numberToRepeat}" =~ ^[1-9][0-9]*$ ]]
    then
        local -r result="$(printf "%${numberToRepeat}s")"
        echo -e "${result// /${string}}"
    fi
}

function isEmptyString(){

    local -r string="${1}"

    if [[ "$(trimString "${string}")" = '' ]]
    then
        echo 'true' && return 0
    fi

    echo 'false' && return 1
}

function trimString(){

    local -r string="${1}"
    sed 's,^[[:blank:]]*,,' <<< "${string}" | sed 's,[[:blank:]]*$,,'
}

#Function to analyze unconfirmed transactions
function unconfirmedTransactions(){

	local number_output=$1; echo '' > ut.tmp
	while [ "$(cat ut.tmp | wc -l)" == "1" ];do
		curl -s $unconfirmed_transactions | html2text > ut.tmp 
	done
	if [ "$number_output" -gt 17 ]; then
		echo -e "\n${redColour}[!] Error: No more than 17 entries can be shown at a time${endColour}\n"
		echo -e "\n${redColour}[!] Exiting program...\n${endColour}"
		rm ut.* 2>/dev/null
		tput cnorm; exit 1
	fi 
	hashes=$(cat ut.tmp | grep "Hash" -A 2 | tr '[' '\n' | grep BTC | tr '/' ' ' | awk 'NF{print $NF}' | sed 's/)//g' | head -n $number_output)
	
	echo "Hash_USD_Bitcon_Time" > ut.table
	for hash in $hashes; do
		echo "${hash}_$(cat ut.tmp | grep "$hash" | grep -oP '(?<=C)(.*?)(?=])')_$(cat ut.tmp | grep "$hash" -B1 | head -n 1 | cut -d":" -f3 | sed 's/^[0-9][0-9]//')_$(cat ut.tmp | grep "${hash}" -B1 | head -n 1 | cut -d"-" -f2 | cut -d" " -f2 | grep -E -o "[0-9]{2}:[0-9]{2}:[0-9]{2}")" >> ut.table
	done	
	
	cat ut.table | tr '_' ' ' | awk '{print $2}' | grep -v USD | tr -d '$' | sed 's/,//g' > ut.money
	local money=0; 
	cat ut.money | while read money_in_line; do
		money=$(echo "$money + $money_in_line" | bc)
		echo $money > ut.famount
	done

	echo -n "Total amount_" > ut.amount
	echo "\$$(printf "%'.d\n" $(cat ut.famount) 2>/dev/null)" >> ut.amount

	if [ "$(cat ut.table | wc -l)" != "1" ]; then
		echo -ne "${yellowColour}"	
		printTable '_' "$(cat ut.table)"
		echo -ne "${endColour}"
		echo -ne "${blueColour}"
		printTable '_' "$(cat ut.amount)"
		echo -ne "${endColour}"
		
		rm ut.* 2>/dev/null	
		tput cnorm; exit 0
	else
		rm ut.* 2>/dev/null
		tput cnorm; exit 1
	fi
}
#Menu for program execution
parameter_counter=0; while getopts "e:n:h:" arg; do
	case $arg in
		e) exploration_mode=$OPTARG; let parameter_counter+=1;;
		n) number_output=$OPTARG; let parameter_counter+=1;;
		h) helpPanel;;
	esac
done

tput civis

#Conditional that will evaluate whether the program has been correctly executed or send the user to the help panel
if [ $parameter_counter -eq 0 ]; then
	helpPanel
else
	if [ "$(echo $exploration_mode)" == "unconfirmed_transactions" ]; then
		if [ ! "$number_output" ]; then
			number_output=12
		fi	
		unconfirmedTransactions $number_output		
	fi
fi	
