# Top file
# For applying multiple state files
# Describe where states should be applied
# /srv/salt/top.sls


base:
  '*':
    - vim
  '*web*':
    - nginx
    - python
  '*db*':
    - mysql
    - drivers