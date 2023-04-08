declare -A map
for i in $(sed -n '3,$p' $1 | awk '{print $1}'); do 
    map+=([$i]=1)
done

if [ ${map[$2]} ]; then 
    echo "Not Unique"
    exit 1
fi