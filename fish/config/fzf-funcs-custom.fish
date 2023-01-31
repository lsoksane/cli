function list-previous-dirs

    set -l all_dirs $dirprev $dirnext $LSF_HISTORY
    if not set -q all_dirs[1]
        return 0
    end

    # Reverse the directories so the most recently visited is first in the list.
    # Also, eliminate duplicates; i.e., we only want the most recent visit to a
    # given directory in the selection list.
    set -l uniq_dirs
    for dir in $all_dirs[-1..1]
        if not contains $dir $uniq_dirs
            set -a uniq_dirs $dir
        end
    end

    printf '%s\n' $uniq_dirs
end

function fzf-previous-dirs-widget
    set -l commandline (__fzf_parse_commandline)
    set -l dir $commandline[1]
    set -l fzf_query $commandline[2]
    set -l prefix $commandline[3]

    test -n "$FZF_TMUX_HEIGHT"; or set FZF_TMUX_HEIGHT 40%
    begin
      set -lx FZF_DEFAULT_OPTS "--height $FZF_TMUX_HEIGHT --reverse --bind=ctrl-z:ignore $FZF_DEFAULT_OPTS $FZF_CTRL_T_OPTS"
      list-previous-dirs | fzf -m --query $fzf_query | while read -l r; set result $result $r; end
    end
    if [ -z "$result" ]
      commandline -f repaint
      return
    else
      # Remove last token from commandline.
      commandline -t ""
    end
    for i in $result
      commandline -it -- $prefix
      commandline -it -- (string escape $i)
      commandline -it -- '/'
    end
    commandline -f repaint
end
