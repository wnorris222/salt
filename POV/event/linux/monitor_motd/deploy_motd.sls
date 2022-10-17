configure_motd:
  file.managed:
    - name: /etc/motd
    - source: salt://Demo/event/linux/monitor_motd/files/motd_config
    - makedirs: True