# echo "insert $PWD" 
columns=($(head -n 1 $1))
data_types=($(head -n 2 $1 | tail -n 1))



declare -i len="${#columns[@]}"
declare -i c=0
record=""
while [ $c -lt $len ]; do
    while true; do
        read -p "${columns[$c]} : " val 
        if [[ $c -eq 0 ]]; then
            if ../../check_type.sh $val "${data_types[$c]}" && ../../is_unique.sh $1 $val ;then
                break
            fi
        elif ../../check_type.sh $val "${data_types[$c]}" ;then
                break
        fi
        
    done
    record+="$val "
    c+=1
done
echo "$record" >> $1