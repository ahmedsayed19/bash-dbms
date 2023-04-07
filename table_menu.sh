read -p "Enter the table Name: " tb

if ../../is_name_valid.sh $tb && ../../is_new_entry.sh $tb; then
    touch $tb
fi



add_type() {
    PS3="select type >"
    types=("str" "int")

    select type in ${types[@]}; do

        case $type in
        str|int)
            column+="-$type"
            break
            ;;
        *)
            echo "Invalid Input"
            ;;
        esac
    done
}

schema=()
while true; do
    finish=0

    PS3="add column >"
    option=("new_column" "done")
    select option in ${option[@]} ; do
        case $option in 
        new_column)
            while true; do
                read -p "Enter the field Name: " field
                if ../../is_name_valid.sh $field ; then
                    break
                fi
            done
            column="$field"
            if [[ ${#schema[@]} -eq 0 ]]; then
                column+="-pk"
            fi
            add_type
            schema+="$column,"

            break
            
            ;;
        done)
            finish=1
            break
            ;;
        *)
            echo "Invalid Input"
        esac
    done

    if [[ $finish -eq 1 ]]; then
        break
    fi
done 



echo $schema > $tb 

############



# add_colunm() {
#     option=("new_column" "done")

#     select option in ${option[@]} ; do
#         if ! [[ $type = 'new_column' ]] || ! [[ $type = 'done' ]] ; then
#             echo "Invalid Input"
#             break
#         read -p "Enter the table Name: " field

#         if ../../is_name_valid.sh $field ; then
#             $1+=",$type"
#         fi
#         break
#     done
# }
# select option in ${option[@]}
# do
#     if [[ c -eq 0 ]]; then
#         echo "Create Primary Key"

# option=("new_column" "done")
# >> create table
# school
# >> add column
# 1) add column
# 2) done
# >> type
# 1) int
# 2) str
