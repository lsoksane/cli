set srcdir (dirname (realpath (status filename)))

set --prepend fish_function_path $srcdir/functions

# Setup function path in a way that avoids running find whenever possible
# If speed is required in a 'fish -c' call,
# specific directories can be given by hand
if set -q INFRADIR
    if not set -q fun_dirs
        set -x fun_dirs (string join ';' (
            find $INFRADIR/fish/functions \
                -mindepth 1 -maxdepth 1 -type d))
    end
    set --prepend fish_function_path (string split ';' $fun_dirs)
end

if status is-interactive
    source $srcdir/config/interactive.fish
end

if which batcat > /dev/null
    alias bat='batcat'
    set -gx BAT_PAGER = ''
    set -g -x BAT_THEME 'GitHub'
end
