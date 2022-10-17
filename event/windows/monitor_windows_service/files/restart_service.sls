##
## POV/event-driven-automation/windows/monitor_windows_firewall/files/restart_service.sls
## 
##  This file is copied to the Salt master in the 'deploy_windows_reactor' state. Its file path 
##  will be /srv/salt/reactor/restart_service.sls
##

{% set server_name = salt['pillar.get']('server_name') %}
{% set service_name = salt['pillar.get']('service_name') %}
{% set service_running = salt['pillar.get']('service_running') %}

{% if not service_running %}
{{ service_name }}:
  service.running
{% endif %}
