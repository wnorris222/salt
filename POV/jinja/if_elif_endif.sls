# Because many distros have different package names, you can use the os grain to set platform specific paths, package names, and other values.
# As you can see, Salt grains are available in a dictionary much like Salt pillar. This example checks Salt grain values to set OS specific Salt pillar keys.

{% if grains['os_family'] == 'RedHat' %}
apache: httpd
git: git
{% elif grains['os_family'] == 'Debian' %}
apache: apache2
git: git-core
{% endif %}