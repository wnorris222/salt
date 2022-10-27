# -- Beacon Configuration --
# file: /etc/salt/minion (fragment)

beacons:
  service:
    named:
      onchangeonly: True
  diskusage:
    - /: 63%
    - /var/log: 50%
    - interval: 120