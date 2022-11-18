# Onlyif state is run "only if" all commands defined return true

# this example creates a new MySQL database user only if the projectDB database exists

create_db_user:
  mysql_user.present:
    - name: jdoe
    - host: localhost
    - password: p@ssw0rd
    - onlyif:
      - mysql -u ro_user -e 'use projectDB'