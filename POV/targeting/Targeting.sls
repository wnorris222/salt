# Targeting



# Glob

Salt \* test.ping


# List

Salt -L web1, web2, web3, db1 test.ping


# Grain

Salt -G 'os: Ubuntu' test.ping


# Pillar

Salt -I 'my_var:my_val' test.ping


# Compound

Salt -C 'min* or *ion' test.ping
Salt -C 'web* or *qa and G@os:Arch' test.ping