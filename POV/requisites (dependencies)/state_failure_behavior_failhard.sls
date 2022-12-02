# State Failure Behavior
# Default = soft fail, salt will try to run each state if one fails
# Can use failhard: True if you want to break out of state run


update_ company_repo:
  file.managed:
    - name: /etc/yum.repos.d/company.repo
    - source: salt://company/yumrepo.conf
    - user: root
    - group: root
    - mode: 644
    - failhard: True          # <-- stop all execution