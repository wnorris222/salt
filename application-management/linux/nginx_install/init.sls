## 
##  This state installs Nginx, and configures a simple web page
##

install_nginx_package:
  pkg.installed:
    - name: nginx

nginx_running:
  service.running:
    - name: nginx
    - require:
      - install_nginx_package

nginx_index_file:
  file.managed:
    - name: /var/www/html/index.html
    - source: salt://Demo/appMgmt/linux/nginx_install/files/index.html.jinja
    - template: jinja
    - require:
      - install_nginx_package