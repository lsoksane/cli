function cdf --description \
'Change directory with fzf'

    set dir (find-dirs $argv)
    if test -n "$dir"
        cd $dir
    end
end
