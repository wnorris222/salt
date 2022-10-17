##
## POV/event-driven-automation/linux/monitor_sshd_config/deploy_sshd_beacon.sls
## 
##  This state ensures 'pyinotify' is installed, copies the beacon configuration to the minion,
##  and restarts the salt-minion service.
##  

install_pip3_package:
  pkg.installed:
    - name: python3-pip

install_inotify_prerequsite:
  pip.installed:
    - name: pyinotify

configure_beacon:
  file.managed:
    - name: /etc/salt/minion.d/sshd_beacons.conf
    - source: salt://Demo/event/linux/monitor_sshd_config/files/CentOS7-beacons.conf
    - makedirs: True

##
## Added this stanza because salt-minion on CentOS 8 does not want to restart by the usual method
##

restart_salt-minion:
  service.running:
    - name: salt-minion
    - enable: True
    - watch:
      - file: /etc/salt/minion.d/sshd_beacons.conf