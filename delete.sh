





choose_column() {
    select col in ${columns[@]} ; do
        if [[ $REPLY -gt ${#columns[@]} ]] ; then
            echo "Invalid input"
        else 
            return $REPLY
        fi
    done     
}




options=("all" "record")
select option in ${options[@]} ; do
    case $REPLY in 
    1)
        columns=($(head -n 1 $1))
        data_types=($(head -n 2 $1 | tail -n 1))
        rm $1
        echo ${columns[*]} > $1
        echo ${data_types[*]} >> $1
        break
        ;;
    2)
        while true ; do
            read -p "Enter the primary key: " word
            type=`sed -n '2,2p' $1 | cut -d' ' -f1`
            if ../../check_type.sh $word $type ;then
                break
            else
                echo "enter a search keyword from the type $type"
            fi
        done
        record=`awk -v q=$word '{ if($1 == q) print NR }' $1`  
        if [[ $record -gt 0 ]] ; then
            sed -i "$record,$record d" $1
            echo "\"$word\" Deleted"
        else
            echo "It does not exist"
        fi
        
        break
        ;;
    *)
        echo "Invalid input"
        ;;
    esac
done