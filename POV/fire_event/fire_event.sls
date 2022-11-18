# If you have a long configuration job that includes several Salt states, you can fire an event when each Salt state completes by adding the fire_event argument:


nano installed:
  pkg.installed:
    - name: nano
    - fire_event: True


# Or if you’d rather, you can replace True with a custom event string that will be appended to the event that is triggered:

nano installed:
  pkg.installed:
    - name: nano
    - fire_event: nano/installed