# pulp_centos_errata_import
Imports CentOS (from http://cefs.steve-meier.de/) errata into pulp

This script imports CentOS Errata into Katello
It relies on preformatted information since parsing email
is the road to madness...

To run this script on CentOS you need:
 - pulp-admin-client
 - pulp-rpm-admin-extensions
 - perl-XML-Simple
 - perl-Text-Unidecode 

This script was modified from Steve Meier's script for spacewalk 
which can be found at http://cefs.steve-meier.de/

# Usage
  1. Sync repositories
  2. Run the script  
     wget -N http://cefs.steve-meier.de/errata.latest.xml  
     ./errata_import.pl --errata=errata.latest.xml --user=[admin] --password=[pass]  
     ( The user name and password can be found under /etc/pulp/server.conf )
  3. Sync repositories so that errata is published. (The errata will not show up on the Katello/Foreman interface until this step is completed. )

# Warning

- I offer no garantees that this script will work for you.
  It is offered as is!
- I have no previews experience with perl, so this script
  will probably look horrific to anyone familiar with the
  language.

# Contributing

Please feel free to make pull requests for any
issues or errors in the script you may find.

