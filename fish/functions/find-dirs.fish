function find-dirs --description \
'Find directory with fzf'

    if test -d "$argv[1]"
        set basedir $argv[1]
        set query $argv[2..]
    else
        if set -q FBASEDIR
            set basedir $FBASEDIR
        else
            set basedir $HOME
        end
        set query $argv
    end

    set dir (find $basedir/ -mindepth 1 -type d -not -path '*/.*' -printf '%P\n' \
        | fzf --scheme=path --query="$query" --select-1)
    if test -n "$dir"
        echo $basedir/$dir
    else
        return 1
    end
end
