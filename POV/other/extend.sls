# Extend is top level declaration used to expand/override data included from other sls files

#/srv/salt/ssh/sshd_config


include:
  - ssh

extend:
  sshd_conf:
    file:
      - name /etc/ssh/sshd_config
      - source: salt://ssh/files/dmz_sshd_config

  ssh_server:
    service:
    - watch:
      - file: add_banner

add_banner:
  file.managed:
    - name: /etc/ssh/banner
    - source: salt: /ssh/files/banner


    