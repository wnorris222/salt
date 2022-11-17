# salt '*' saltutil.refresh_pillar
# has top file for targeting
# ex pillar file data editor: vim
# would install vim
# pillar keys are available in a dictionary



Vim installed:
  pkg.installed:
    - name: {{ pillar['editor'] }}