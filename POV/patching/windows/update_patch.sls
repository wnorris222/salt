##
## POV/patching/windows/update_patches.sls
## 
##  This state checks for and installs updates on the minion
##

run_win_updates:
  wua.uptodate