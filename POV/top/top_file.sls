# Top file
# For applying multiple state files
# Describe where states should be applied


base:
  '*':
    - vim
  '*web*':
    - nginx
    - python
  '*db*':
    - mysql
    - drivers