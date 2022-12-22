"Deploy Site":
  win_iis.deployed:
    - name: Salt
    - sourcepath: C:\inetpub\wwwroot\salt
    - apppool: SaltStack
    - port: 8090
    - protocol: http
