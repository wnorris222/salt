revert-file:
  local.state.apply:
    - tgt: {{ data['id'] }}
    - arg:
      - Demo.event.linux.monitor_motd.deploy_motd