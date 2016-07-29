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
  2. Run the script - The user name and password can be found under /etc/pulp/server.conf    
     wget -N http://cefs.steve-meier.de/errata.latest.xml  
     ./errata_import.pl --errata=errata.latest.xml --user=[admin] --password=[pass]  
  3. Go to "Administer" > "Settings" > "Katello" and set "force_post_sync_action" to true. (Katello 3.0 and up)
  4. Sync repositories so that errata is published. (The errata will not show up on the Katello/Foreman interface until this step is completed. )

# Parameters 

[Required]  
   --errata    - Path to the errata XML file.  
   --user      - Pulp user (Usually admin, unless you are creating a pulp user specifically for this script).  
   --password  - Pulp password (Found under /etc/pulp/server.conf, unless you are creating a pulp user specifically for this script).  

[Optional]  
   --rhsa-oval     - Path to the OVAL XML file from Red Hat (recommended)  
   --include-repo  - Only consider packages and errata in the provided repositories. Can be provided multiple times.  

[Logging]  
   --quiet         - Only print warnings and errors  
   --debug         - Set verbosity to debug (use this when reporting issues!)  

# Warning

- I offer no garantees that this script will work for you.
  It is offered as is!
- I have no previous experience with perl, so this script
  will probably look horrific to anyone familiar with the
  language.

# Contributing

Please feel free to make pull requests for any
issues or errors in the script you may find.

