columns=($(head -n 1 $1))
data_types=($(head -n 2 $1 | tail -n 1))

choose_column() {
    select i in ${columns[@]} ; do
        if [ $REPLY -gt ${#columns[@]} ] 2> /dev/null ; then
            echo "Invalid input"
        else 
            return $REPLY
        fi
    done     
}


while true ; do
    read -p "Enter the primary key: " pk
    type=`sed -n '2,2p' $1 | cut -d' ' -f1`
    if ../../check_type.sh $pk $type ;then
        break
    else
        echo "enter a word from the type $type"
    fi
done


choose_column
declare -i col=$?
col=$col-1
echo "col $col"
while true; do
    read -p "${columns[$col]} : " val 
    if [[ $col -eq 0 ]]; then
        if ../../check_type.sh $val "${data_types[$col]}" && ../../is_unique.sh $1 $val ;then
            break
        fi
    elif ../../check_type.sh $val "${data_types[$col]}" ;then
        break
    fi
done
col=$col+1
awk -v pk=$pk -v new=$val -v place=$col '{ if($1 == pk) { $place=new } print $0 }' $1 > "$1+"
cat "$1+" > $1
rm "$1+"
echo "updated"


# update_record(){
#     choose_column
#     declare -i col=$?
#     while true; do
#         read -p "${columns[$col]} : " val 
#         if [[ $col -eq 0 ]]; then
#             if ../../check_type.sh $val "${data_types[$col]}" && ../../is_unique.sh $1 $val ;then
#                 break
#             fi
#         elif ../../check_type.sh $val "${data_types[$col]}" ;then
#             break
#         fi
#     done
#     return $val
# }

#     record=`awk -v q=$word '{ if($1 == q) print NR }' $1`  
#     if [[ $record -gt 0 ]] ; then
#         sed -n "$record,$record p" $1
#         echo "\"$word\" Deleted"
#     else
#         echo "It does not exist"
#     fi









    # choose_column
    # col=$?
    # while true ; do
    #     read -p "Enter the search keyword: " word
    #     type=`sed -n '2,2p' $1 | cut -d' ' -f$col`
    #     if ../../check_type.sh $word $type ;then
    #         break
    #     else
    #         echo "enter a search keyword from the type $type"
    #     fi
    # done
    # while true ; do
    #     read -p "Enter the new value: " val
    #     type=`sed -n '2,2p' $1 | cut -d' ' -f$col`
    #     if ../../check_type.sh $val $type ;then
    #         break
    #     else
    #         echo "enter a search keyword from the type $type"
    #     fi
    # done
    # echo "$word Results: "
    # select record in $(awk -v ncol=$col -v q=$word '{ if($ncol == q) print $0 }' $1); do
        
    # done
    # break