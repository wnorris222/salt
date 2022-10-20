revert-file:
  local.state.apply:
    - tgt: {{ data['id'] }}
    - arg:
      - POV.event-driven-automation.linux.monitor_motd.deploy_motd