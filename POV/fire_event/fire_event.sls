# If you have a long configuration job that includes several Salt states, you can fire an event when each Salt state completes by adding the fire_event argument:


nano installed:
  pkg.installed:
    - name: nano
    - fire_event: True