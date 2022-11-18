# Use gives ability to "use" another state, and its arguments as defaults
# Can modify arguments as needed in the new state



manage_eth0:
  network.managed:
    - name: etho
    - enabled: True
    - type: eth
    - proto: static
    - ipaddr: 10.1.0.7
    - netmask: 255.255.255.0
    - gateway: 10.1.0.1
    - enable_ipv6: True
    - ipv6proto: static
    - ipvpipaddrs:
      - 2001:db8:dead:beef::3/64
      - 2001:db8:dead:beef::7/64
    - ipv6gateway: 2001:db8:dead:beef::1
    - ipv6netmask: 64
    - dns:
    - 8.8.8.8
    - 8.8.4.4


manage_eth1:
  network.managed:
    - name: eth1
    - ipaddr: 192.168.0.120
    - gateway: 192.168.0.1
    - ipv6ipaddr: 2001:db8:dead:c0::3
    - ipv6gateway: 2001:db8:dead:c0::1
    - use:
      - network: manage_eth0
   