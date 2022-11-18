# OnChanges only applies if another state has changes AND if the watched state's result is true
# Does not execute if no changes were made in the other state
# Compared to watch requisite which still runs mod_watch to check service


dns_service:
  service.running:
    - name: named
    - enabled: True
    - on changes:
      - file: dns_conf

dns_conf:
  file.managed:
    - name: /etc/named.conf
    - source: salt://dns/files/named.conf