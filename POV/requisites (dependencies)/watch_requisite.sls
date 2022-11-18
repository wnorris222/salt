# watch requisite is more advanced than the require requisite
# watch also checks to see if the watched states have returned any changes
# Watch process:
#  - monitors a state for any changes made by that state
#  - executes a function in the event a change has taken place by the "watched" state



# restart a service if changes are made to a configuration file
# if no changes to install or copy states, still runs "mod_watch function" to see if the service is running, if not will start service

install_redis:
  pkg.latest:
    - name: redis-server

copy_redis_conf:
  file.managed:
    - source: salt://redis/redis.conf
    - name: /etc/redis.conf

check_redis_service:
  service.running:
    - name: redis-server
    - enable: True
    - watch:
      - copy_redis_conf
      - install_redis