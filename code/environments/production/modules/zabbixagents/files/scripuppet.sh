#!/bin/bash

# Initialize the counter
counter=0

# Infinite loop to run the task every 40 seconds
while true; do
  # Increment the counter
  ((counter++))
  ((counter++))
  ((counter++))
  ((counter++))
  # Save the counter to the /tmp/hola file
  echo "Counter: $counter" > /tmp/puppet

  # Wait for 40 seconds before running again
  sleep 40
done

