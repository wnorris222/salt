{% set app = salt['pillar.get']('app', 'SaltStack') %}
{% set path = salt['pillar.get']('path', 'C:\inetpub\wwwroot\salt') %}
{% set pool = salt['pillar.get']('pool', 'SaltStack') %}
{% set port = salt['pillar.get']('port', '8090') %}
{% set proto = salt['pillar.get']('proto', 'http') %}
{% set site = salt['pillar.get']('site', 'Salt') %}

TrustedInstaller:
  service.running:
    - enable: True

"Install Web-Server Role":
  win_servermanager.installed:
    - recurse: True
    - name: Web-Server

{{ path }}:
  file.recurse:
    - source: salt://website
    - include_empty: True
    - require:
      - win_servermanager: "Install Web-Server Role"

{{ path }}\index.html:
  file.managed:
    - source: salt://website/index.html
    - template: jinja
    - require:
      - file: {{ path }}

"Create Pool":
  win_iis.create_apppool:
    - name: {{ pool }}
    - require:
      - file: {{ path }}\index.html

"Deploy Site":
  win_iis.deployed:
    - name: {{ site }}
    - sourcepath: {{ path }}
    - apppool: {{ pool }}
    - port: {{ port }}
    - protocol: {{ proto }}
    - require:
      - win_iis: "Create Pool"

"Create Binding":
  win_iis.create_binding:
    - site: {{ site }}
    - ipaddress: '*'
    - port: {{ port }}
    - protocol: '{{ proto }}'
    - sslflags: 0
    - require:
      - win_iis: "Deploy Site"

"Create App":
  win_iis.create_app:
    - name: {{ app }}
    - site: {{ site }}
    - sourcepath: {{ path }}
    - apppool: {{ pool }}
    - require:
      - win_iis: "Create Binding"

"IIS Install":
  slack.post_message:
    - channel: 'general'
    - from_name: 'Your Friendly Neighborhood SALT Master'
    - message: 'IIS was just installed on `{{ grains['id'] }}` at URL <http://{{ grains['ipv4'][1] }}:{{ port }}>'
    - webhook: {{ pillar['slack']['hook'] }}
