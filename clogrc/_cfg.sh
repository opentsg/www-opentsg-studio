#                                                              _
#  __ __ __ __ __ __ __ __ __  ___   ___   _ __   ___   _ _   | |_   ___  __ _
#  \ V  V / \ V  V / \ V  V / |___| / _ \ | '_ \ / -_) | ' \  |  _| (_-< / _` |
#   \_/\_/   \_/\_/   \_/\_/        \___/ | .__/ \___| |_||_|  \__| /__/ \__, |
#                                         |_|                            |___/
if [ -z "$(echo $SHELL|grep zsh)" ];then eval "$(clog Inc)";else source <(clog Inc);fi
PROJECT="$(basename $(pwd))"
bEXE="$PROJECT"
bDOCKER_NS="opentsg"
callingSCRIPT="${0##*/}"
vCodeType="hugo"
vCodeSrc="data/releases.yaml"
# A golang module must have a "v" semver prefix. A website does not
vCODE=$(clog Sh vCODE)
bMSG=$(clog Sh git-message-ref)
