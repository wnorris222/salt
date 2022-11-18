# Declare Jinja list
{% set users = ['fred', 'bob', 'frank'] %}

# Jinja `for' loop

{% for user in users %}
create_{{ user }}:
  user.present:
    - name: {{ user }}
{% endfor %}




{% for usr in ['moe','larry','curly'] %}
{{ usr }}:
  user.present
{% endfor %}