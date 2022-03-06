set fzf_version 0.29.0

set srcdir (realpath (status dirname))
source $srcdir/fish/functions/symlink.fish
symlink $HOME/.config/fish/config.fish $srcdir/fish/config.fish 

set bindir (realpath (dirname (status fish-path))/../../)
pushd $bindir
curl -L https://github.com/junegunn/fzf/releases/download/$fzf_version/fzf-$fzf_version-linux_amd64.tar.gz | tar xz 
popd