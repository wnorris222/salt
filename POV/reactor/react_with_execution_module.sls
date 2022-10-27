# File: /srv/reactor/restart-web-farm.sls

restart_service:
  local.service.restart:
    - tgt: 'web*'
    - arg:
      - httpd