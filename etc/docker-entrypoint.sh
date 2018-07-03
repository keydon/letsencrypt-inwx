hasErrors=false

if [ -z "$INWX_USER" ]; then
	echo "ERROR: Missing env-argument INWX_USER"
	hasErrors=true
fi

if [ -z "$INWX_PASSWD" ]; then
	echo "ERROR: Missing env-argument INWX_PASSWD"
	hasErrors=true
fi

if [ $hasErrors = true ]; then
	exit 1;
fi

printf "$INWX_USER\n$INWX_PASSWD" > /etc/letsencrypt-inwx-cred
chmod 600 /etc/letsencrypt-inwx-cred

set -x
certbot -n --agree-tos --server https://acme-v02.api.letsencrypt.org/directory $@
set +x

rm /etc/letsencrypt-inwx-cred