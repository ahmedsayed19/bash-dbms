
if [[ -d bash_dbms ]]
then
    cd bash_dbms
else
    mkdir bash_dbms
    cd bash_dbms
fi

home_options=("Create_Database" "List_Databases" "Connect_To_Databases" "Drop_Database" "Exit")
PS3="bash bdms #?>"
select option in ${home_options[@]}
do
    
    case $option in
    # Two case values are declared here for matching
    Create_Database)
        read -p "Enter the Database Name: " db

        if ../is_name_valid.sh $db && ../is_new_entry.sh $db; then
            mkdir $db
        fi
    ;;
    List_Databases)
        echo "Databases: "
        ls
    ;;
    Connect_To_Databases)
        PS3="connect >"
        echo "c $PWD"
        select db in $(ls)
        do            
            cd $db
            ../../database_menu.sh $db
            cd ..
            PS3="bash bdms #?>"
            break
        done
    ;;
    Drop_Database)
        PS3="remove >"
        select db in $(ls)
        do
            rm -r $db
            PS3="bash bdms #?>"
            break
        done
    ;;
    Exit)
        break
    ;;
    *)
    echo "Invalid Input."
    ;;
    esac
done


# TO-DO
# perm_validation(){
#     perms="stat -c "%a" $PWD"

#     if [[ let $((perms)) -lt 775]]
#     then
#         echo "You Have To Have The rwx Permissions to run this script"
#         return 0
#     else 
#         return 1
#     fi
# }