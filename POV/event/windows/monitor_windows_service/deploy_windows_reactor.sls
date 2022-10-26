##
## 
## 
##  This state delivers the reactor configuration and SLS response file to the Salt master, and 
##  restarts the salt-master service
##

configure_start_win_service:
  file.managed:
    - name: /srv/salt/reactor/start_win_service.sls
    - source: salt://POV/event/windows/monitor_windows_service/files/start_win_service.sls
    - makedirs: True

configure_restart_win_service:
  file.managed:
    - name: /srv/salt/reactor/restart_service.sls 
    - source: salt://POV/event/windows/monitor_windows_service/files/restart_service.sls
    - makedirs: True
    
configure_windows_reactor.conf:
  file.managed:
    - name: /etc/salt/master.d/mpssvc_reactor.conf
    - source: salt://POV/event/windows/monitor_windows_service/files/windows_reactor.conf
    - makedirs: True

restart_salt_master_service:
  service.running:
    - name: salt-master
    - watch:
      - configure_windows_reactor.conf