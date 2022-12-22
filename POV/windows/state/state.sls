"Install Web-Server Role":
  salt.state:
    - tgt: 'osfinger:Windows-2016Server'
    - tgt_type: grain
    - sls: windows.iis.install-role

"Copy Files":
  salt.state:
    - tgt: 'osfinger:Windows-2016Server'
    - tgt_type: grain
    - sls: windows.iis.copy-files
    - require:
      - salt: "Install Web-Server Role"

"Create Pool":
  salt.state:
    - tgt: 'osfinger:Windows-2016Server'
    - tgt_type: grain
    - sls: windows.iis.create-pool
    - require:
      - salt: "Copy Files"
      
"Deploy Site":
  salt.state:
    - tgt: 'osfinger:Windows-2016Server'
    - tgt_type: grain
    - sls: windows.iis.deploy-site
    - require:
      - salt: "Create Pool"

"Create Binding":
  salt.state:
    - tgt: 'osfinger:Windows-2016Server'
    - tgt_type: grain
    - sls: windows.iis.create-binding
    - require:
      - salt: "Deploy Site"
      
"Create App":
  salt.state:
    - tgt: 'osfinger:Windows-2016Server'
    - tgt_type: grain
    - sls: windows.iis.create-app
    - require:
      - salt: "Create Binding"