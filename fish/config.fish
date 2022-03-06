set --prepend fish_function_path (status dirname)/functions

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
