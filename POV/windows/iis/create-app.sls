"Create App":
  win_iis.create_app:
    - name: SaltStack
    - site: Salt
    - sourcepath: C:\inetpub\wwwroot\salt
    - apppool: SaltStack
