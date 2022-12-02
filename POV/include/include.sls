# include
# /srv/salt/somefile.sls
# can use include to include another file from where salt states are stored
# if should always include can be better than using top file
# If only some systems should receive both Salt states, including both states in the Top file gives you the flexibility to choose which systems receive each.
# use a . if there is a subdirectory dir.sls1


include:
  - somefile(.sls but don't add sls)



install package:
  pkg.installed:
    - name: http