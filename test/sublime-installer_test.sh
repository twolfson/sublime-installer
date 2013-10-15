#!/bin/sh

# Update the prompt information based on the version
if test "$SUBLIME_TEXT_VERSION" = "2"; then
  EXPECTED_PROMPT="Sublime Text 2 Build 2221"
elif test "$SUBLIME_TEXT_VERSION" = "3"; then
  # EXPECTED_PROMPT="Sublime Text Build 3047"
  # Fail on purpose
  EXPECTED_PROMPT="Sublime Text Build 3040"
fi

# Assert the prompt is as expected
ACTUAL_PROMPT="$(subl --version)"
if test "$EXPECTED_PROMPT" != "$ACTUAL_PROMPT"; then
  echo "Sublime Text $SUBLIME_TEXT_VERSION prompt did not match as expected" 1>&2
  echo "  Actual: $ACTUAL_PROMPT" 1>&2
  echo "  Expected: $EXPECTED_PROMPT" 1>&2
  exit 1
fi
