#!/usr/bin/env bash

set -eu

if [ $# -ne 3 ]; then
  echo "Usage: $0 keyfilepath srcfilepath dstfilepath" 1>&2
  exit 1
fi

# need absolute path because of docker mount point
keyfilepath=$(readlink -f "$1")
srcfilepath=$(readlink -f "$2")
dstfilepath=$(readlink -f "$3")

if [[ "$keyfilepath" != *.k4i ]]; then
  echo "keyfile: $keyfilepath should be end with .k4i" 1>&2
fi
if [[ "$srcfilepath" != *.azw ]]; then
  echo "srcfile: $srcfilepath should be end with .azw" 1>&2
fi
if [[ "$dstfilepath" != *.azw3 ]]; then
  echo "dstfile: $dstfilepath should be end with .azw3" 1>&2
fi

srcdirpath=$(dirname "$srcfilepath")
srcfilename=$(basename "$srcfilepath")
dstdirpath=$(dirname "$dstfilepath")
dstfilename=$(basename "$dstfilepath")
tmpkeydirpath=$(mktemp -d)

# work around for https://github.com/apprenticeharper/DeDRM_tools/blob/b1d13f2b/src/k4mobidedrm.py#L265-L274
orig_srcfilename=$srcfilename
srcfilename=tmpname.azw
ln -s "$orig_srcfilename" "$srcdirpath/$srcfilename"

function cleanup() {
  if [[ -L "$srcdirpath/$srcfilename" ]]; then
    rm "$srcdirpath/$srcfilename"
  fi
}
trap cleanup EXIT

cp "$keyfilepath" "$tmpkeydirpath"

image=k9h5/dedrm-kindle
docker container run -v "$dstdirpath":"/root/out" -v "$srcdirpath":"/root/in" -v "$tmpkeydirpath":"/root/.DeDRMPrefs" -it $image "/root/in/$srcfilename"

mv "$dstdirpath/tmpname_nodrm.azw3" "$dstdirpath/$dstfilename"
