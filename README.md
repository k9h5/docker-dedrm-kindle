# docker-dedrm-kindle

## How to use

### easy script (Recommended)

#### single file convert

1. [Extract your kindle key](https://github.com/apprenticeharper/DeDRM_tools/blob/b1d13f2b/src/DeDRM_Kindle%20for%20Mac%20and%20PC%20Key_Help.htm)
1. Get your kindle content file (*.azw) bounds with your key
1. `filename=convert.sh bash -c 'wget "https://raw.githubusercontent.com/k9h5/docker-dedrm-kindle/master/$filename" -O ~/bin/$filename && chmod +x ~/bin/$filename'`
1. `./convert.sh keyfilepath srcfilepath dstdirpath`
1. Read content of dstdirpath or convert other formats

#### multiple files convert

1. [Extract your kindle key](https://github.com/apprenticeharper/DeDRM_tools/blob/b1d13f2b/src/DeDRM_Kindle%20for%20Mac%20and%20PC%20Key_Help.htm)
1. Get your kindle content files (*.azw) bound with your key
1. `filename=convert.sh bash -c 'wget "https://raw.githubusercontent.com/k9h5/docker-dedrm-kindle/master/$filename" -O ~/bin/$filename && chmod +x ~/bin/$filename'`
1. `filename=convert-all.sh bash -c 'wget "https://raw.githubusercontent.com/k9h5/docker-dedrm-kindle/master/$filename" -O ~/bin/$filename && chmod +x ~/bin/$filename'`
1. `./convert-all.sh keyfilepath srcdirpath dstdirpath`
1. Read contents of dstdirpath or convert other formats

### Use docker image directly

1. [Extract your kindle key](https://github.com/apprenticeharper/DeDRM_tools/blob/b1d13f2b/src/DeDRM_Kindle%20for%20Mac%20and%20PC%20Key_Help.htm) and name it as 'default_key.k4i'
1. Get your kindle content file (*.azw) bounds with your key
1. `docker container run --rm -v <<DIRECTORY_ABSOLUTE_PATH_OF_content_file>>:/root/out -v <<DIRECTORY_ABSOLUTE_PATH_OF_default_key.k4i>>:/root/.DeDRMPrefs k9h5/dedrm-kindle '/root/out/<<content_file>>.azw'`
1. Read <<content_file>>_nodrm.azw3 or convert other formats

## Security

Contents inside Docker image is proved by [https://hub\.docker\.com/r/k9h5/dedrm\-kindle/builds/](https://hub.docker.com/r/k9h5/dedrm-kindle/builds/), so you don't have to be afraid of key sniffing or other security risks.
