    
    
    if [[ $# -ne 2 ]]
    then
        echo "White Spaces Are Invalid"
        exit 1
    fi
    
    
    
    
    if [[ $2 = "int" ]]; then
        valid_pattern="^[1-9][0-9]*$"
        if [[ $1 =~ $valid_pattern ]]
        then
            exit 0
        else 
            echo "Only nums, Can't start with zero"
            exit 1
        fi
    elif [[ $2 = "str" ]];then
        valid_pattern="^[0-9a-zA-Z_]*$"
    
        if [[ $1 =~ $valid_pattern ]]
        then
            exit 0
        else 
            echo "Only _ and Alphanums"
            exit 1
        fi
    fi