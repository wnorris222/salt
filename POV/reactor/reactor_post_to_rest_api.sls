post_to_rest_api:
  runner.http.query:
    - url: http://cmdb.corp.com
    - method: POST
    - params:
      - key1: val1
      - key2: val2
      - key3: val3