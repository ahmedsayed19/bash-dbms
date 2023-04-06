
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
        echo "Quite"
        break
        ;;
        *)
        echo "Invalid Input."
        ;;
        esac
    done
}


home_options=("Create_Database" "List_Databases" "Connect_To_Databases" "Drop_Database")

select option in ${home_options[@]}
do
    
    case $option in
    # Two case values are declared here for matching
    Create_Database)
    echo "Create Database"
    ;;
    List_Databases)
    echo "List Database"
    ;;
    Connect_To_Databases)
    echo "Connect To Database"
    database_menu
    ;;
    Drop_Database)
    echo "Drop Database"
    ;;
    *)
    echo "Invalid Input."
    ;;
    esac
done

