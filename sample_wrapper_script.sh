#!/bin/bash

cd /tmp

wget -N http://cefs.steve-meier.de/errata.latest.xml
wget -N https://www.redhat.com/security/data/oval/com.redhat.rhsa-all.xml

# See README.md about setting up the credentials for pulp-admin
# It his **highly** recommended that the password be passed on the commandline.

/sbin/errata_import.pl --errata=/tmp/errata.latest.xml --rhsa-oval=/tmp/com.redhat.rhsa-all.xml --debug --include-repo=Org-CentOS_7_x86_64-CentOS_7_x86_64_Base Org-CentOS_7_x86_64-CentOS_7_x86_64_Updates Org-CentOS_7_x86_64-CentOS_7_x86_64_Extras

# If all of the repos that you want to import the errata into contain an indentifying pattern
# in their labels you can use something like the following to ensure you don't miss new repos.

# pulp-admin repo list --fields id | awk '/CentOS/ { print "--include-repo="$NF }' | xargs /sbin/errata_import.pl --errata=/tmp/errata.latest.xml --rhsa-oval=/tmp/com.redhat.rhsa-all.xml
