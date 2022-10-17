##
## POV/event-driven-automation/linux/monitor_sshd_config/deliver_sshd_config.sls
## 
##  This state delivers the reference copy of /etc/ssh/sshd_config
##

configure_sshd:
  file.managed:
    - name: /etc/ssh/sshd_config
    - source: salt://Demo/event/linux/monitor_sshd_config/files/CentOS7-sshd_config
    - makedirs: True

reload_sshd:
  service.running:
    - name: sshd
    - enable: True
    - reload: True
    - watch:
      - configure_sshd