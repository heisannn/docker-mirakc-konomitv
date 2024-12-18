if [ -z "$BCAS_SERVER" ]
then
  echo "BCAS_SERVER must be defined" >&2
  exit 1
fi

rm -rf /var/run/pcscd
mkdir -p /var/run/pcscd

echo "Create a UNIX-domain socket to communicate with a remote BCAS server listening on $BCAS_SERVER"
socat unix-listen:/var/run/pcscd/pcscd.comm,fork tcp-connect:$BCAS_SERVER &

echo "Start a descrambling server on tcp 40773"
socat tcp-listen:40773,fork,reuseaddr system:'arib-b25-stream-test -v 0'
