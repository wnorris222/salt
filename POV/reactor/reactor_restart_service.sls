{% if data['spooler']['running'] == False %}
restart-spooler:
  local.service.restart:
    - tgt: {{ data['id'] }}
    - arg:
      - spooler
{% endif %}