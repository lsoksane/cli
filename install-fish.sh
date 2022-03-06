bindir=$1
if test -z "$bindir"
then
    echo 'Expected bin directory path as an argument'
    exit 1
fi

mkdir -p $bindir/fish-portable
pushd $bindir
curl https://github.com/xxh/fish-portable/releases/download/3.3.1/fish-portable-musl-alpine-Linux-x86_64.tar.gz
tar xf fish-portable-musl-alpine-Linux-x86_64.tar.gz --directory=fish-portable
ln -s fish-portable/bin/fish fish
popd
