pcopfer.duplicity
=================

A role to install and configure duplicity for GPG enrypted inremental backups. Backups are encrypted by password and connection to backuplocation via ssh-keys.

Role Variables
--------------

- ``duplicity_priv_ssh_key`` SSH key for connection to Backup-Location (public key has to be deployed)
- ``duplicity_backup_password`` Password for Backup
- ``duplicity_scheme`` scheme of the Backup connection (see: http://duplicity.nongnu.org/duplicity.1.html)
- ``duplicity_target_user`` User for connection to Backup Target (if need)
- ``duplicity_target_pub_host_key`` SSH public Host key for backup host
- ``duplicity_target_domain`` Backup target domain
- ``duplicity_target_path`` Path to the Backup on the destination system (script will add $Hostname/$Filename for each Backupfile)

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - role: pcopfer.duplicity
      vars:
         - duplicity_priv_ssh_key: "{{ backup_priv_ssh_key_vault }}"
	 - duplicity_backup_password: "{{ backup_password_vault }}"
         - duplicity_scheme: "rsync"
         - duplicity_target_user: "user1"
	 - duplicity_target_domain: "home.example.org"
	 - duplicity_target_path: "/home/example/backup/"
	 - duplicity_target_pub_host_key: "public_host_key"

License
-------

BSD

Author Information
------------------

pcopfer <christian-platz at pcopfer.de>
