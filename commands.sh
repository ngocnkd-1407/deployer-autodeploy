#!/bin/bash
mkdir /root/.ssh
echo -e $PLUGIN_PUBLICKEY > /root/.ssh/id_rsa.pub
echo -e $PLUGIN_PRIVATEKEY > /root/.ssh/id_rsa
chmod 700 /root/.ssh
chmod 600 /root/.ssh/id_rsa
chmod 644 /root/.ssh/id_rsa.pub

echo -e "Host *\n\tStrictHostKeyChecking no\n\tIdentityFile /root/.ssh/id_rsa\n\tAddKeysToAgent yes\n" >> /root/.ssh/config
echo "commandcollapse $PLUGIN_RUN"
$PLUGIN_RUN
echo -e "deploy:\n  comment: false\n  exit_code: $?\n  ignore: false" >> ./.framgia-ci-result.temp.yml
