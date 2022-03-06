bindir=$1
if test -z "$bindir"
then
    echo 'Expected bin directory path as an argument'
    exit 1
fi

mkdir -p $bindir/fish-portable
pushd $bindir
curl -LO https://github.com/xxh/fish-portable/releases/download/3.3.1/fish-portable-musl-alpine-Linux-x86_64.tar.gz
tar xf fish-portable-musl-alpine-Linux-x86_64.tar.gz --directory=fish-portable

cat > $bindir/fish <<'EOF'
#!/bin/sh
export TERMINFO_DIRS=/lib/terminfo:/etc/terminfo:/usr/share/terminfo:$TERMINFO_DIRS
CURRENT_DIR="$(cd "$(dirname "$0")" && pwd)"
$CURRENT_DIR/fish-portable/bin/fish "$@"
EOF

chmod +x $bindir/fish
popd
