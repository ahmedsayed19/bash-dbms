
    PS3="$1 #?>"
    database_options=( "Create_Table"  "List_Tables" "Drop_Table" "Insert_into_Table" "Select_From_Table" "Delete_From_Table" "Update_Table" "Quite")
    select option in ${database_options[@]}
    do
        case $option in
        # Two case values are declared here for matching
        Create_Table)
            echo "database menu $PWD" 
            ../../table_menu.sh $1
        ;;
        List_Tables)
            echo "Tables: "
            ls
        ;;
        Drop_Table)
            PS3="remove table>"
            select tb in $(ls)
            do
                rm $tb
                PS3="$1 #?>"
                break
            done
        ;;
        Insert_into_Table)
            while true; do
                read -p "table name: " tb
                if ../../is_name_valid.sh $tb && [[ -e $tb ]]; then
                    break
                fi
            done
            ../../insert.sh $tb
        ;;
        Select_From_Table)
            while true; do
                read -p "table name: " tb
                if ../../is_name_valid.sh $tb && [[ -e $tb ]]; then
                    break
                fi
            done
            echo " To select "
            ../../select.sh $tb
        ;;
        Delete_From_Table)
            while true; do
                read -p "table name: " tb
                if ../../is_name_valid.sh $tb && [[ -e $tb ]]; then
                    break
                fi
            done
            ../../delete.sh $tb
        ;;
        Update_Table)
            while true; do
                read -p "table name: " tb
                if ../../is_name_valid.sh $tb && [[ -e $tb ]]; then
                    break
                fi
            done
            ../../update.sh $tb
        ;;
        Quite)
            echo "Quite"
            break
        ;;
        *)
        echo "Invalid Input."
        ;;
        esac
    done
