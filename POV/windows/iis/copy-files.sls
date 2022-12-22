C:\inetpub\wwwroot\salt:
  file.recurse:
    - source: salt://website
    - include_empty: True

C:\inetpub\wwwroot\salt\index.html:
  file.managed:
    - source: salt://website/index.html
    - template: jinja
    - require:
      - file: C:\inetpub\wwwroot\salt
