
    valid_str="^[a-zA-Z_][a-zA-Z0-9_]*$"
    if [[ $# -ne 1 ]]
    then
        echo "White Spaces Are Invalid"
        exit 1
    elif [[ $1 =~ $valid_str ]]
    then
        exit 0
    else 
        echo "Only _ and Alphanums, Can't start with num"
        exit 1
    fi
