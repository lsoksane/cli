function confirm --argument-names prompt --description \
'Get a yes or no answer from user' 

    if test -z "$prompt"
        set prompt 'Proceed?'
    end
    while true
        read -P "$prompt [Y/n]: " line
        switch $line
            case '' y Y yes YES 
                return 0
            case n N no NO 
                return 1
        end
        echo 'Error: invalid input'
    end
end
