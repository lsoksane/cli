function from-template --argument-names file class --description \
'Create file using a template' 

    set pieces (string split . $file)
    set suffix $pieces[-1]"$class"
    set file_nosuffix "$pieces[..-2]"
    if contains "$suffix" (find $INFRADIR/templates/mush -type f -printf '%P\n')
        # variables for mush
        set -x basename (basename $file)
        set -x basename_nosuffix (basename $file_nosuffix)
        set -x date (date)

        cat $INFRADIR/templates/mush/$suffix | mush > $file
    else if contains "$suffix" (find $INFRADIR/templates/plain -type f -printf '%P\n')
        cp $INFRADIR/templates/plain/$suffix $file
    else
        touch "$file"
    end
end
