
    if [[ -d $1 ]]
    then
        echo "This database already exist"
        exit 1
    else 
        exit 0
    fi
