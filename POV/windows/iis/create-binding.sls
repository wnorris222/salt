"Create Binding":
  win_iis.create_binding:
    - site: Salt
    - ipaddress: '*'
    - port: 8090
    - protocol: 'http'
    - sslflags: 0
