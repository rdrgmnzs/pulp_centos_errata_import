#!/bin/bash

cd /tmp

wget -N http://cefs.steve-meier.de/errata.latest.xml
wget -N https://www.redhat.com/security/data/oval/com.redhat.rhsa-all.xml

PASSWORD=$(grep -i ^default_password /etc/pulp/server.conf | awk '{print $2}')

/sbin/errata_import.pl --errata=/tmp/errata.latest.xml --rhsa-oval=/tmp/com.redhat.rhsa-all.xml --user=admin --password=$PASSWORD --debug --include-repo=Org-CentOS_7_x86_64-CentOS_7_x86_64_Base Org-CentOS_7_x86_64-CentOS_7_x86_64_Updates Org-CentOS_7_x86_64-CentOS_7_x86_64_Extras

