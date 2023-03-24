# Top file
# For applying multiple state files
# Describe where states should be applied
# Each key defines an environment (base)
# /srv/salt/top.sls


base:
  '*':
    - vim
  '*web*':
    - nginx
    - python
  '*db*':
    - mysql