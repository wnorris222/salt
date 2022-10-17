##
## POV/patching/windows/install_KB.sls
## 
##  This state will install a list of KBs from pillar data
##
## The pillar data could look like the following example, in JSON format:
##{
##    "kb": [
##        "KB5005568",
##        "KB5005653"
##    ]
##}

{% for kb in salt['pillar.get']('kb') %}

 install_updates_{{ kb }}:
   wua.installed:
    - updates:
      - {{ kb }}
      
{% endfor %}