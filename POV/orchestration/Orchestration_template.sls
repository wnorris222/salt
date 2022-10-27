# Orchestration
# template for salt.function

id_declaration:
  salt.function:
    - name: exec_module.function
    - tgt: '<your-targets>'
    - tgt_type: 'type-of-targeting'


# template for salt.state

id_declaration:
  salt.state:
    - tgt: '<your-targets>'
    - tgt_type: 'type-of-targeting'
    - sls:
      - state1
      - state2


# template for salt.runner
id_declaration:
  salt.runner:
    - name: runner.function
    - kwarg: value

