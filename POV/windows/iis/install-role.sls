TrustedInstaller:
  service.running:
    - enable: True

"Install Web-Server Role":
  win_servermanager.installed:
    - recurse: True
    - name: Web-Server
