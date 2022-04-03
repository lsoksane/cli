function symlink --argument-names name target --description \
'Create symlink to target' 

    if test -e $name 
            or test -L $name
        rm $name
    else
        mkdir -p (dirname $name)
    end
    ln -sv (realpath $target) $name
end
