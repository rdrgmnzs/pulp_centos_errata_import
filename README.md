# pulp_centos_errata_import
Imports CentOS (from http://cefs.steve-meier.de/) errata into pulp

This script imports CentOS Errata into Katello
It relies on preformatted information since parsing email
is the road to madness...

To run this script on CentOS you need:
 - pulp-admin-client
 - pulp-rpm-admin-extensions
 - perl-XML-Simple
 - perl-XML-Parser
 - perl-Text-Unidecode 

This script was modified from Steve Meier's script for spacewalk  
which can be found at http://cefs.steve-meier.de/

# Usage
  1. Sync repositories
  2. See [Authentication](#Authentication) Below
  3. Run the script  
     wget -N http://cefs.steve-meier.de/errata.latest.xml
     ./errata_import.pl --errata=errata.latest.xml [--user=admin] [--password=pass]  
  4. Go to "Administer" > "Settings" > "Katello" and set "force_post_sync_action" to true. (Katello 3.0 and up)
  5. Sync repositories so that errata is published. (The errata will not show up on the Katello/Foreman interface until this step is completed. )

# Authentication

pulp-admin must authenticate to pulp.  This authentication information can be provided to pulp-admin in three ways.

  1. User certificate (~/.pulp/user-cert.pem) **RECOMMENDED**  
    If you are using this script with katello, the foreman-installer creates a certificate suitable for use with pulp.  You can use the cert by doing the following:

    ```shell
    sudo cat /etc/pki/katello/certs/pulp-client.crt /etc/pki/katello/private/pulp-client.key > ~/.pulp/user-cert.pem
    chown 400 ~/pulp/user-cert.pem
    ```
  2. Admin configuration file (~/.pulp/admin.conf) **RECOMMENDED**  
    You can provide the auth credentials in the pulp-admin configuration file.  Simply create ~/.pulp/admin.conf, you can get the password from /etc/pulp/server.conf (default_password).

    ```ini
    [auth]
    username: admin
    password: <password>
    ```
    Make sure the permissions on this file are restrictive.

    ```shell
    chmod 400 ~/.pulp/admin.conf
    ```
  3. Command line parameters (--user, --password) **NOT RECOMMENDED**  
    It is **strongly** recommended that you do not use this method.

    ```shell
    ./errata_import.pl --errata=<errata_file> --user=admin --password=<password>
    ```
For methods 1 and 2, it is probably advisable to not store these credentials in a normal user's home directory.  You might consider using the root user for pulp-admin tasks.  Then non-privileged users can be given rights explicitly through sudo.  

# Parameters 

[Required]  
   --errata    - Path to the errata XML file.  

[Optional]  
   --user          - Pulp user (Usually admin, unless you are creating a pulp user specifically for this script).  
   --password      - Pulp password (Found under /etc/pulp/server.conf, unless you are creating a pulp user specifically for this script).  
   --rhsa-oval     - Path to the OVAL XML file from Red Hat (recommended)  
   --include-repo  - Only consider packages and errata in the provided repositories. Can be provided multiple times.  

[Logging]  
   --quiet         - Only print warnings and errors  
   --debug         - Set verbosity to debug (use this when reporting issues!)  

# Warning

- I offer no guarantees that this script will work for you.
  It is offered as is!
- I have no previous experience with perl, so this script
  will probably look horrific to anyone familiar with the
  language.

# Contributing

Please feel free to make pull requests for any
issues or errors in the script you may find.

