VAR=${VAR@Q}

if [[ ${VAR::1} = $ ]]
then
  VAR=${VAR:1}
fi

VAR=${VAR:1:-1}
