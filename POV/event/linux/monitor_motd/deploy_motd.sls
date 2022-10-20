configure_motd:
  file.managed:
    - name: /etc/motd
    - source: salt://POV/event-driven-automation/linux/monitor_motd/files/motd_config
    - makedirs: True