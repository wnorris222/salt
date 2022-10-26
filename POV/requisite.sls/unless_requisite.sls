# unless requisite. This installed vim unless vim-enhanced exists or vim already exists

# only one condition needs to evaluate to true to prevent vim from being installed

vim: 
  pkg.installed:
    - unless:
      - rpm -q vim-enhanced
      - ls /usr/bin/vim