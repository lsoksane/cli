function ls --description \
'Pimped ls' 
    set nf (command ls -C --literal $argv | head -n 1 \
        | awk --field-separator="  " "{ print NF }")
    if test -n "$nf"
        set w (math $COLUMNS - 2 \* $nf)
    else
        set w $COLUMNS
    end
    command ls --literal \
        --width=$w \
        --hyperlink=always --color=always \
        --group-directories-first $argv
end
