# would pass this a map.yaml file with data

{% import_yaml 'minion/map.yaml as users %}
{ % set user_data = pillar.get('users') %}

{% for user in users %}
remove_existing_{{ user }}:
  user.absent:
    - name: {{ user }}
    - purge: True

create_user_{{ user }}:
  user.present:
    - name: {{ user }}
    - fullname: {{ users[user]['fullname'] }}
    - uid: {{ users[user]['uid'] }}
    - password {{ user_data[user]['password'] }}
{% endfor %}

