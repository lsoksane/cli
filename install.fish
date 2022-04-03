set srcdir (realpath (status dirname))
source $srcdir/fish/functions/symlink.fish
symlink $HOME/.config/fish/config.fish $srcdir/fish/config.fish

pushd install
    set scripts (find *.fish)
    for script in $scripts
        set_color green
        echo "Running $script"
        set_color normal
        fish $script
    end
popd
