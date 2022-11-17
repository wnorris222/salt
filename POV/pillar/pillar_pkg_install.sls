# salt '*' saltutil.refresh_pillar
# has top file for targeting
# ex pillar file data editor: vim
# would install vim



Vim installed:
  pkg.installed:
    - name: {{ pillar['editor'] }}