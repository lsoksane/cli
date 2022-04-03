function colors --description \
'Show available terminal colors' 
    for n in (seq 0 255)
        printf '%3d ' $n
        tput setaf $n
        printf '\U2588\U2588\U2588 \n'    
        tput sgr0
    end
end
