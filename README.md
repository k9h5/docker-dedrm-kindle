# docker-dedrm-kindle

## How to use (Recommended)
1. [Extract your kindle key](https://github.com/apprenticeharper/DeDRM_tools/blob/b1d13f2b/src/DeDRM_Kindle%20for%20Mac%20and%20PC%20Key_Help.htm)
2. Get your kindle content file (*.azw) bounds with your key
3. `./convert.sh keyfilepath srcfilepath dstfilepath`
4. Read dstfilepath or convert other formats


## Use docker image directly

1. [Extract your kindle key](https://github.com/apprenticeharper/DeDRM_tools/blob/b1d13f2b/src/DeDRM_Kindle%20for%20Mac%20and%20PC%20Key_Help.htm) and name it as 'default_key.k4i'
2. Get your kindle content file (*.azw) bounds with your key
3. `docker container run -v <<DIRECTORY_ABSOLUTE_PATH_OF_content_file>>:/root/out -v <<DIRECTORY_ABSOLUTE_PATH_OF_default_key.k4i>>:/root/.DeDRMPrefs -it k9h5/dedrm-kindle '/root/out/<<content_file>>.azw'`
4. Read <<content_file>>_nodrm.azw3 or convert other formats

## Security

Contents inside Docker image is proved by [https://hub\.docker\.com/r/k9h5/dedrm\-kindle/builds/](https://hub.docker.com/r/k9h5/dedrm-kindle/builds/), so you don't have to be afraid of key sniffing or other security risks.
