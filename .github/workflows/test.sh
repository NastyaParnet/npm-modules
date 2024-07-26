#!/bin/bash

if [ ! -s name.txt ]; then
    echo "Error: name.txt is empty."
    exit 1
fi

PACKAGE_NAME=$(cat ./name.txt | tr -d '[:space:]')

npm init -y
npm install "$PACKAGE_NAME" --save || exit 1

EXPECTED_OUTPUT="Score: 91, ECTS Grade: A
Score: 80, ECTS Grade: C
Score: 70, ECTS Grade: D
Score: 60, ECTS Grade: E
Score: 45, ECTS Grade: F
Score: 30, ECTS Grade: F"

ACTUAL_OUTPUT=$(node test.js "$PACKAGE_NAME")

if echo "$ACTUAL_OUTPUT" | grep -q "Score: 91, ECTS Grade: A" && \
   echo "$ACTUAL_OUTPUT" | grep -q "Score: 80, ECTS Grade: C" && \
   echo "$ACTUAL_OUTPUT" | grep -q "Score: 70, ECTS Grade: D" && \
   echo "$ACTUAL_OUTPUT" | grep -q "Score: 60, ECTS Grade: E" && \
   echo "$ACTUAL_OUTPUT" | grep -q "Score: 45, ECTS Grade: F" && \
   echo "$ACTUAL_OUTPUT" | grep -q "Score: 30, ECTS Grade: F"; then
  echo "Test passed: Output matches expected result."
else
  echo "Test failed: Output does not match expected result."
  echo "Actual: $ACTUAL_OUTPUT"
  echo "Expected: $EXPECTED_OUTPUT"
  exit 1
fi
