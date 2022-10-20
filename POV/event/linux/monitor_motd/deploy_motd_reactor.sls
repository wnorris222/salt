##
## Demo/event/linux/monitor_motd/deploy_motd_reactor.sls
## 
##  This state delivers the reactor configuratoin and SLS response file to the Salt master, and 
##  restarts the salt-master service
##

configure_reactor.conf:
  file.managed:
    - name: /etc/salt/master.d/motd_reactor.conf
    - source: salt://POV/event-driven-automation/linux/monitor_motd/files/motd_reactor.conf
    - makedirs: True

configure_sshd_remediation:
  file.managed:
    - name: /srv/reactor/motd.sls
    - source: salt://POV/event-driven-automation/linux/monitor_motd/files/motd_remediate.sls
    - makedirs: True

restart_salt_master_service:
  service.running:
    - name: salt-master
    - watch:
      - configure_reactor.conf