# require requisite ensures that the required states are executed before the state that requires it
# use State_Module: [ID | name]
# Can remove module reference and just use ID (install_samba)
# can use: salt 'minion1' state.show_sls to see order states will execute

install_samba:
  pkg.installed:
    - name: samba-server


check_samba_service:
  service.running:
    - name: smbd
    - enable: True
    - require:
      - pkg: install_samba   # <-- Referenced by module:ID

    # or it could be 
    - require:
      - pkg: samba-server    # <-- Referenced by module:name 

    # or it could be
    - require:
      - install_samba        # <-- Reference by ID