pcopfer.duplicity
=================

A role to install and configure duplicity for GPG enrypted inremental backups. Backups are encrypted by password and connection to backuplocation via ssh-keys.

Role Variables
--------------

- ``duplicity_priv_ssh_key`` SSH key for connection to Backup-Location (public key has to be deployed)
- ``duplicity_backup_password`` Password for Backup
- ``duplicity_target_pub_host_key`` SSH public Host key for backup host
- ``duplicity_target_domain`` Backup target domain
- ``duplicity_target_url`` Backup target URL (see: http://duplicity.nongnu.org/duplicity.1.html)

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - role: pcopfer.duplicity
      vars:
         - duplicity_priv_ssh_key: "{{ backup_priv_ssh_key_vault }}"
	 - duplicity_backup_password: "{{ backup_password_vault }}"
	 - duplicity_target_domain: "home.example.org"
         - duplicity_target_url: "rsync://{{ duplicity_target_domain }}/backup/"
	 - duplicity_target_pub_host_key: "public_host_key"

License
-------

BSD

Author Information
------------------

pcopfer <christian-platz at pcopfer.de>
