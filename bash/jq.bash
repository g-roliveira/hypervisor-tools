IFS=$'\n'
for c in $(echo "$VAR" | jq '.[].category'); do
  echo $c
  echo "$(echo "$VAR" | jq ".[] | select (.category==$c).modifiers[].modifier")"
  echo
done
