#!/bin/bash
#
# Rapatriement des logs de PARTAGE
#
# -----------------------------------------------------------------------------
# SPDX-License-Identifier: GPL-3.0-or-later
# License-Filename: LICENSE 
#
# Authors :
#
#   - Yann 'Ze' Richard <yann.richard à univ-rennes2.fr> - DSI Université Rennes 2
#
# -----------------------------------------------------------------------------
PATH="/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/sbin:/usr/local/bin"
LDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
echoerr() { echo "$@" 1>&2; }
function command_exists () { 
    command -v "$1" >/dev/null 2>&1; 
}

TMPDIR=$(mktemp -d -t 'get-partage-logs.XXXXXX')
if [[ ! "$TMPDIR" || ! -d "$TMPDIR" ]]
then
    echoerr "Could not create temp dir"
    exit 1
fi
trap 'rm -rf "$TMPDIR"' EXIT

# -----------------------------------------------------------------------------
# Chargement de la configuration + verifications
usage() {
    echoerr "Usage: $0 [-c <config file>]";
    exit 1;
}

configFile="$LDIR/config-get-partage-logs"
while getopts ":c:" o; do
    case "${o}" in
        c)
            configFile=${OPTARG}
            ;;
        *)
            usage
            ;;
    esac
done
shift $((OPTIND-1))

if [ ! -e "$configFile" ]
then
    echoerr "Configuration file does not exists : $configFile"
    exit 1
fi

# Doit définir : 
#   LOGUSER="leuser"
#   LOGHOST="leserveurdelogdepartage.renater.fr"
#   LOGPORT=10022
#   DESTDIR_LOG_NG=/la/ou/tu/veux/tes/logs/partage
#   SSH_KEY=/la/ou/est/la/ssh-key-partage
#   MAX_LOG_DAYS=365   
# shellcheck disable=SC1090 disable=SC1091
. "$configFile"
if [ -z "$LOGUSER" ]
then
    echoerr "LOGUSER is not defined..."
    exit 1
fi
if [ -z "$DESTDIR_LOG_NG" ] 
then
    echoerr "DESTDIR_LOG_NG is not defined or empty..."
    exit 1
fi
if [ "$DESTDIR_LOG_NG" == "/" ]
then
    echoerr "DESTDIR_LOG_NG is equal to '/' ?!"
    exit 1
fi
if ! command_exists "lftp"
then
    echoerr "lftp is not installed"
    exit 1
fi

# -----------------------------------------------------------------------------
LFTP_OPTS=''
if [ "$GET_ONLY_DAYS" -gt 0 ]
then
    LFTP_OPTS="--newer-than='now-${GET_ONLY_DAYS}days'"
fi
TODAY=$(date +%Y-%m-%d)
mkdir -p "${DESTDIR_LOG_NG}/${TODAY}"
cat <<EOF >> "$TMPDIR/lftp-script"
    set sftp:auto-confirm yes
    set sftp:connect-program "ssh -a -x -i $SSH_KEY"
    set mirror:parallel-directories true
    #set xfer:log true
    #set xfer:log-file "/tmp/renater-partage-ng.log"
    open sftp://${LOGUSER}:FAKEPWD@${LOGHOST}:${LOGPORT:-10022} 
    # logs compressées
    mirror $LFTP_OPTS --use-cache --continue --parallel=10 --no-empty-dirs --include=".*.log.gz" /logs/ ${DESTDIR_LOG_NG}/
    # logs du jour
    lcd "${DESTDIR_LOG_NG}/${TODAY}"
    mget -c --parallel=10 /logs/${TODAY}/*.log
    bye
EOF
lftp -f "$TMPDIR/lftp-script" > /dev/null

# Remove des .log plus vieux de 1 jours (Il y aura la version compressée)
YESTERDAY=$(date -d "yesterday" '+%Y%m%d2359.59')
touch -t "$YESTERDAY" "$TMPDIR/yesterday"
find "${DESTDIR_LOG_NG}" -type f -name "*.log" -not -newer "$TMPDIR/yesterday" -delete

# Remove des logs plus vieux que MAX_LOG_DAYS
RE_INT='^[0-9]+$'
if [[ $MAX_LOG_DAYS =~ $RE_INT ]]
then
    find "${DESTDIR_LOG_NG}" -type f '(' -name "*.log" -o -name "*.log.gz" ')' -mtime +"${MAX_LOG_DAYS}" -delete
else
    echoerr "MAX_LOG_DAYS not defined or not a digit (${MAX_LOG_DAYS})"
fi

# delete empty directories
find "${DESTDIR_LOG_NG}" -type d -empty -delete
