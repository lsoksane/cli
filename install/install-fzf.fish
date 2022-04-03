set fzf_version 0.29.0

pushd $LOCALDIR/bin-portable
curl -L https://github.com/junegunn/fzf/releases/download/$fzf_version/fzf-$fzf_version-linux_amd64.tar.gz | tar xz
popd
