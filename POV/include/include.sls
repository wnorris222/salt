# include
# /srv/salt/somefile.sls
# can use include to include another file from where salt states are stored
# if should always include can be better than using top file


include:
  - somefile(.sls but don't add sls)



install package:
  pkg.installed:
    - name: http