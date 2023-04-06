
database_menu(){
    database_options=( "Create_Table"  "List_Tables" "Drop_Table" "Insert_into_Table" "Select_From_Table" "Delete_From_Table" "Update_Table" "Quite")
    select option in ${database_options[@]}
    do
        case $option in
        # Two case values are declared here for matching
        Create_Table)
        echo "Create_Table"
        ;;
        List_Tables)
        echo "List_Tables"
        ;;
        Drop_Table)
        echo "Drop_Table"
        ;;
        Insert_into_Table)
        echo "Insert_into_Table"
        ;;
        Select_From_Table)
        echo "Select_From_Table"
        ;;
        Delete_From_Table)
        echo "Delete_From_Table"
        ;;
        Update_Table)
        echo "Update_Table"
        ;;
        Quite)
        PS3="bash bdms #?>"
        echo "Quite"
        break
        ;;
        *)
        echo "Invalid Input."
        ;;
        esac
    done
}

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
        mkdir $db
        # echo "Create Database"
    ;;
    List_Databases)
        echo "Databases: "
        ls
    ;;
    Connect_To_Databases)
        ls
        read -p "Enter the Database Name: " db
        cd $db
        PS3="$db #?>"
        database_menu
    ;;
    Drop_Database)
        read -p "Enter the Database Name: " db
        rm -r $db
    ;;
    Exit)
        break
    ;;
    *)
    echo "Invalid Input."
    ;;
    esac
done

