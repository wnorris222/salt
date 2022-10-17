##
## Demo/event-driven-automation/linux/deploy_motd_beacon/deploy_motd_beacon.sls
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

configure_motd:
  file.managed:
    - name: /etc/motd
    - source: salt://Demo/event/linux/monitor_motd/files/motd_config
    - makedirs: True

configure_beacon:
  file.managed:
    - name: /etc/salt/minion.d/motd_beacons.conf
    - source: salt://Demo/event/linux/monitor_motd/files/Linux-beacons.conf
    - makedirs: True

##
## Added this stanza because salt-minion on CentOS 8 does not want to restart by the usual method
##

{%- if grains['os'] != 'Windows' %}
Restart Salt Minion:
  cmd.run:
    - name: 'salt-call service.restart salt-minion'
    - bg: True
    - watch:
      - file: /etc/salt/minion.d/motd_beacons.conf
{%- endif %}