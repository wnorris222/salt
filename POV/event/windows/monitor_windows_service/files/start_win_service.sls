##
## POV/event-driven-automation/windows/monitor_windows_firewall/files/start_win_service.sls
## 
##  This file is copied to the Salt master in the 'deploy_mpssvc_reactor' state. Its file path 
##  will be /srv/salt/reactor/start_win_service.sls
##

{% set service_name = data['service_name'] %}

{% if data[service_name]['running'] == false %}
start {{ service_name }}:
  local.state.apply:
  - tgt: {{data['id']}}
  - args:
    - mods: reactor.restart_service
    - pillar:
        server_name: {{ data['id'] }}
        service_name: {{ service_name }}
        service_running: {{ data[service_name]['running'] }}
{% endif %}