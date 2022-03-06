set fzf_version 0.29.0
set micro_version 2.0.10

set srcdir (realpath (status dirname))
source $srcdir/fish/functions/symlink.fish
symlink $HOME/.config/fish/config.fish $srcdir/fish/config.fish 

set bindir (realpath (dirname (status fish-path))/../../)
pushd $bindir
curl -L https://github.com/junegunn/fzf/releases/download/$fzf_version/fzf-$fzf_version-linux_amd64.tar.gz | tar xz 
popd

pushd (mktemp -d)
curl -L https://github.com/zyedidia/micro/releases/download/v$micro_version/micro-$micro_version-linux64-static.tar.gz | tar xz 
cp micro-$micro_version/micro $bindir
popd
symlink $HOME/.config/micro/settings.json $srcdir/micro/settings.json 
symlink $HOME/.config/micro/bindings.json $srcdir/micro/bindings.json 
