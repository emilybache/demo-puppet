#!/bin/bash
set -e
# Make sure only root can run this script
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

INSTALLATION_FOLDER="${HOME}/demo-puppet"
BRANCH="master"

if [ -d "${INSTALLATION_FOLDER}" ];
then
	rm -r "${INSTALLATION_FOLDER}";
fi

git clone --branch "${BRANCH}" --single-branch 'https://github.com/emilybache/demo-puppet.git' "${INSTALLATION_FOLDER}"
cd "${INSTALLATION_FOLDER}"
puppet apply --modulepath=modules/ manifests/site.pp
