set micro_version 2.0.11

set confdir (status dirname)/../micro

pushd (mktemp -d)
curl -L https://github.com/zyedidia/micro/releases/download/v$micro_version/micro-$micro_version-linux64-static.tar.gz | tar xz
cp micro-$micro_version/micro $LOCALDIR/bin-portable
popd
symlink $HOME/.config/micro/settings.json $confdir/settings.json
symlink $HOME/.config/micro/bindings.json $confdir/bindings.json
