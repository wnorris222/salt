# Include can be used to bring in data from another SLS file
# want to combine many states into one
# if SLS file needs to require or watch components found in another SLS file
# /srv/salt/core.sls

include:
  - ssh
  - sudo
  - edit.vim
  - ntp