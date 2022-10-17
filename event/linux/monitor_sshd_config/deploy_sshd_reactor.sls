##
## POV/event-driven-automation/linux/monitor_sshd_config/deploy_sshd_reactor.sls
## 
##  This state delivers the reactor configuratoin and SLS response file to the Salt master, and 
##  restarts the salt-master service
##

configure_reactor.conf:
  file.managed:
    - name: /etc/salt/master.d/sshd_reactor.conf
    - source: salt://Demo/event/linux/monitor_sshd_config/files/sshd_reactor.conf
    - makedirs: True

configure_sshd_remediation:
  file.managed:
    - name: /srv/reactor/sshd.sls
    - source: salt://Demo/event/linux/monitor_sshd_config/files/sshd_remediate.sls
    - makedirs: True

restart_salt_master_service:
  service.running:
    - name: salt-master
    - watch:
      - configure_reactor.conf