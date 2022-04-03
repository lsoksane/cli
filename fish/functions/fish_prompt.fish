function fish_prompt --description \
'Runs when the prompt is to be shown'

    set -l last_pipestatus $pipestatus
    set -lx __fish_last_status $status # Export for __fish_print_pipestatus.
    set -l normal (set_color normal)
    set -q fish_color_status
    or set -g fish_color_status --background=red white

    # Write pipestatus
    # If the status was carried over (e.g. after `set`), don't bold it.
    set -l bold_flag --bold
    set -q __fish_prompt_status_generation; or set -g __fish_prompt_status_generation $status_generation
    if test $__fish_prompt_status_generation = $status_generation
        set bold_flag
    end
    set __fish_prompt_status_generation $status_generation
    set -l status_color (set_color $fish_color_status)
    set -l statusb_color (set_color $bold_flag $fish_color_status)
    set -l prompt_status (__fish_print_pipestatus "[" "]" "|" "$status_color" "$statusb_color" $last_pipestatus)

    if test "$PREVPWD" != "$PWD"
        if functions -q hook_dir_changed
            hook_dir_changed "$PWD"
        end
    end
    set -gx PREVPWD $PWD

    if set -q CONDA_PROMPT_MODIFIER
        if test "$CONDA_PROMPT_MODIFIER" != '(shell) '
            set_color $color_prompt_conda --background $color_prompt_bg
            printf '\U1F40D%s ' (string sub -s 2 -e -2 $CONDA_PROMPT_MODIFIER)
            set_color normal
        end
    else
        set_color $color_prompt_conda --background $color_prompt_bg
        printf '\U1F40D(none) '
        set_color normal
    end
    set -l gp (fish_git_prompt)
    if test -n "$gp"
        set_color $color_prompt_git --background $color_prompt_bg
        printf '\UE0A0 %s ' (string sub -s 3 -e -1 $gp)
        set_color normal
    end
    set_color --background $color_prompt_bg
    echo -n (prompt_pwd)
    if test -n "$prompt_status"
        echo -n " $prompt_status"
    end
    set_color normal
    set_color $color_prompt_bg
    echo -n \uE0B0
    set_color normal
    echo -n ' '

end
