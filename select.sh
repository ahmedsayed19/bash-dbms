echo " from select "
columns=($(head -n 1 $1))

choose_column() {
    select col in ${columns[@]} ; do
        if [[ $REPLY -gt ${#columns[@]} ]] ; then
            echo "Invalid input"
        else 
            return $REPLY
        fi
    done     
}

options=("all" "columns" "record")
select option in ${options[@]} ; do
    echo $REPLY
    case $REPLY in 
    1)
        cat $1
        break
        ;;
    2)
        choose_column
        sed -n '3,$p' $1 | awk -v n=$? '{print $n}'  
        echo "$? from columns $?"
        break
        ;;
    3)
        choose_column
        col=$?
        while true ; do
            read -p "Enter the search keyword: " word
            type=`sed -n '2,2p' $1 | cut -d' ' -f$col`
            if ../../check_type.sh $word $type ;then
                break
            else
                echo "enter a search keyword from the type $type"
            fi
        done
        echo "$word Results: "
        awk -v ncol=$col -v q=$word '{ if($ncol == q) print $0 }' $1
        break
        ;;
    *)
        echo "Invalid input"
        ;;
    esac
done