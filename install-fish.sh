fish_version=3.4.1

if test -z "$LOCALDIR"
then
    echo 'LOCALDIR must be set'
    exit 1
fi

mkdir -p $LOCALDIR/bin-portable/fish-portable
pushd $LOCALDIR/bin-portable
curl -L https://github.com/xxh/fish-portable/releases/download/$fish_version/fish-portable-musl-alpine-Linux-x86_64.tar.gz \
    | tar xz --directory=fish-portable

cat > fish <<'EOF'
#!/bin/sh
export TERMINFO_DIRS=/lib/terminfo:/etc/terminfo:/usr/share/terminfo:$TERMINFO_DIRS
CURRENT_DIR="$(cd "$(dirname "$0")" && pwd)"
$CURRENT_DIR/fish-portable/bin/fish "$@"
EOF

chmod +x fish
popd
