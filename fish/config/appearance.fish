source $LOCALDIR/config/base16_colors.fish

set -gx fish_color_normal normal
set -gx fish_color_command $color0D
set -gx fish_color_quote $color0B
set -gx fish_color_redirection $color0C
set -gx fish_color_end $color0E
set -gx fish_color_error $color08
set -gx fish_color_param $color05
set -gx fish_color_match $color0A
set -gx fish_color_comment $color03
set -gx fish_color_selection normal --background=$color02
set -gx fish_color_search_match bryellow --background=$color02
set -gx fish_color_history_current --bold
set -gx fish_color_operator $color0E
set -gx fish_color_escape $color0C
set -gx fish_color_cancel -r
set -gx fish_color_valid_path --bold
set -gx fish_color_autosuggestion $color03
set -gx fish_color_user brgreen
set -gx fish_pager_color_description $color0B
set -gx fish_pager_color_completion normal
set -gx fish_pager_color_prefix normal $color0C
set -gx fish_pager_color_progress normal --background=$color01

set -gx color_prompt_bg $color02
set -gx color_prompt_git $color0C
set -gx color_prompt_conda $color0B
set -gx fish_color_status red --background=$color_prompt_bg

set -gx __fish_git_prompt_show_informative_status
set -gx __fish_git_prompt_char_stateseparator ''
set -gx __fish_git_prompt_char_upstream_ahead \U1F4EE
set -gx __fish_git_prompt_char_upstream_behind \U1F4EC
set -gx __fish_git_prompt_char_dirtystate \U1F4DD
set -gx __fish_git_prompt_char_stagedstate \U1F4E4
set -gx __fish_git_prompt_char_untrackedfiles \U1F4CE
set -gx __fish_git_prompt_char_stashstate \U1F4E6
set -gx __fish_git_prompt_char_conflictedstate \U26A0
set -gx __fish_git_prompt_char_invalidstate \U26D4
set -gx __fish_git_prompt_char_upstream_diverged \U1F9E9

set -U -x FZF_DEFAULT_OPTS '--height 40% --layout=reverse --inline-info'\
" --color=bg+:$color02,bg:$color00,spinner:$color0C,hl:$color0C"\
" --color=fg:$color05,header:$color0D,info:$color03,pointer:$color06"\
" --color=marker:$color0C,fg+:$color06,prompt:$color03,hl+:$color0C"

set -gx LS_COLORS (printf (cat $LOCALDIR/config/ls_colors))
set -gx LS_IMPORTANT (cat $LOCALDIR/config/ls_important)

#set -g -x BAT_THEME 'base16'
