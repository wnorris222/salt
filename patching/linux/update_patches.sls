##
## POV/patching/linux/update_patches.sls
## 
##  This state checks for and installs updates on the minion
##

update_packages:
  pkg.uptodate:
    - refresh: True