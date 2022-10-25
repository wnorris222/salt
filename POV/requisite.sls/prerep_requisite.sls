# Prereq requisite will take action based on the expected results of a state that has not yet been executed
# 


graceful-down:
  module.run:
    - name: service.stop
    - m_names:
      - tomcat
    - prerequ:
      - file: site-code


site-code:
  file.recurse:
    - name: /opt/site_code
    - source: salt://site/code

