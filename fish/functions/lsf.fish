function lsf --description \
'List directory with fzf'

    set dir (find-dirs $argv)
    if test -n "$dir"
        set_color -o
        command ls -d --hyperlink=always (realpath $dir)
        set_color normal
        ls $dir
    end
end
