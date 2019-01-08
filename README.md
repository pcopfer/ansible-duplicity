pcopfer.duplicity
=================

A role to install and configure duplicity for GPG enrypted inremental backups.

Role Variables
--------------
TODO!
- ``postsrsd_exclude_domains: ".{{ postfix_domain }}"``
- ``dovecot_lmtp: false`` Disable dovecot_lmtp Dovecot Local Mail transport

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - role: pcopfer.duplicity

License
-------

BSD

Author Information
------------------

pcopfer <christian-platz at pcopfer.de>
