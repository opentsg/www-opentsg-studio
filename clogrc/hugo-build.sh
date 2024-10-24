# usage> build
# short> www-opentsg-studio
# long>  build the hugo site
#                                                              _
#  __ __ __ __ __ __ __ __ __  ___   ___   _ __   ___   _ _   | |_   ___  __ _
#  \ V  V / \ V  V / \ V  V / |___| / _ \ | '_ \ / -_) | ' \  |  _| (_-< / _` |
#   \_/\_/   \_/\_/   \_/\_/        \___/ | .__/ \___| |_||_|  \__| /__/ \__, |
#                                         |_|                            |___/
source <(clog Inc)
source clogrc/_cfg.sh
clog Check

buildErrs=0
DST=public

CMD="rm -fr $DST/*"
fInfo "purging old builds:  $ $cC$CMD$cX"
$CMD
[ $? -gt 0 ] && ((buildErrs++)) && fError "purging faild - continuiing anyway"

IMAGE="$bDOCKER_NS/$PROJECT"
GREP_SEARCH="mrx"
OPTS="-q --force-rm"
DoPUSH="$1"

fInfo "building the static website to $cF$DST/: $cC hugo$cX"
hugo --gc  --minify
[ $? -gt 0 ] && ((buildErrs++)) && fError "hugo build failed ($err)" && exit 1

fOk   "building the static website to $cF$DST/$cs Success$cX"
fInfo "executing$cC docker build$cT with opts: $cW$OPTS\n$cX"
AMDtarget="$IMAGE-amd:$vCODE"; dAMDtarget="$cW$IMAGE$cT-amd:$cE$vCODE$cX"
ARMtarget="$IMAGE-arm:$vCODE"; dARMtarget="$cW$IMAGE$cT-arm:$cE$vCODE$cX"

fInfo "Build image $dAMDtarget"
docker build $OPTS -t "$AMDtarget" --platform linux/amd64 .
[ $? -gt 0 ] && ((buildErrs++))

fInfo "Build image $dARMtarget"
docker build $OPTS -t "$ARMtarget" --platform linux/arm64 .
[ $? -gt 0 ] && ((buildErrs++))

BuildImageFound="$(docker images | grep "$GREP_SEARCH")"
[[ $buildErrs > 0 ]] || [ -z BuildImageFound ]  && \
   fError "Build failed or $cE $GREP_SEARCH$cT docker images not found locally\n" \
   fError"Aborting....\n" \
   exit 1

fInfo "1. start:$cC     docker$cT run --detach --rm --publish 11999:80 --name$cI $NAME $dAMDtarget$cX"
fInfo "     or:$cC      docker$cT run --detach --rm --publish 11999:80 --name$cI $NAME $dARMtarget$cX"
fInfo "2. stop:$cC      docker$cT stop$cW $NAME$cX"
fInfo "3. deploy:$cC    clog$cT deploy$cW $NAME$cX"
[ -z "$DoPUSH" ] && fInfo "3. push:$cC    docker$cT push $dAMDtarget"
[ -z "$DoPUSH" ] && fInfo "4. push:$cC    docker$cT push $dARMtarget"
