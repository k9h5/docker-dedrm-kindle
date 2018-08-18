#!/usr/bin/env bash

set -eu

if [ $# -ne 3 ]; then
  echo "Usage: $0 keyfilepath srcdirpath dstdirpath" 1>&2
  exit 1
fi

keyfilepath=$(realpath -s $1)
srcdirpath=$(realpath -s $2)
dstdirpath=$(realpath -s $3)

if [[ $keyfilepath != *.k4i ]]; then
  echo "keyfile: $keyfilepath should be end with .k4i" 1>&2
fi
if [[ ! -d $srcdirpath ]]; then
  echo "srcdirpath: $srcdirpath should be a directory" 1>&2
fi
if [[ ! -d $dstdirpath ]]; then
  echo "dstdirpath: $dstdirpath should be a directory" 1>&2
fi

for srcfilepath in $(find $srcdirpath -name "*.azw"); do
  filename_ext=$(basename $srcfilepath)
  filename=${filename_ext%.azw}
  dstfilepath=$dstdirpath/${filename}_nodrm.azw3
  if [[ -e $dstfilepath ]]; then
    echo "$srcfilepath is already converted."
  else
    echo "$srcfilepath is converting now ..."
    ./convert.sh $keyfilepath $srcfilepath $dstfilepath
  fi
done
