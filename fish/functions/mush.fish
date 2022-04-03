function mush --argument-names varfile --description \
'Minimimalistic templating implementing a tiny subset of mustache
 https://mustache.github.io/mustache.5.html' 

    if test -n "$varfile"
        source $varfile
    end
    while read line
        set tags (echo $line | grep -o '{{[^}]*}}' -)
        set sed_prog ''
        for tag in $tags
            set var (string sub -s 3 -e -2 $tag)
            set sed_prog $sed_prog "
s/$tag/$$var/"
        end
        if test -n "$sed_prog"
            echo $line | sed "$sed_prog"
        else
            echo $line
        end
    end
end
