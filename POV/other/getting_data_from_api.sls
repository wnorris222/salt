# App server returns data as a list of user data:
# [{'username':'value', 'uid':'value','shell':'value'}]

{% set user_data = salt['http.query']{https://app.domain/userservice/users','method=GET') %}

{for user in user_data %}
create_{{ user['username'] }}:
  user.present:
    - name: user['username']
    - uid: user['uid']
    - shell: user['shell']
{% endfor %}