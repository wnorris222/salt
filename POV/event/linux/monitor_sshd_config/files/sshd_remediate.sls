##
## POV/event-driven-automation/linux/monitor_sshd_config/files/sshd_remediate.sls
## 
##  This file is delivered to the salt-master in the 'deploy_sshd_reactor.sls' state
##

revert-file:
  local.state.apply:
    - tgt: {{ data['id'] }}
    - arg:
      - Demo.event.linux.monitor_sshd_config.deliver_sshd_config