#!/bin/bash
set -e

if [ ! -f coverage/lcov.info ]; then
  echo "❌ coverage/lcov.info not found. Run 'flutter test --coverage' first."
  exit 1
fi

calculate_coverage() {
  lcov --summary coverage/lcov.info | grep "lines" | awk '{print $2}' | tr -d '%'
}

MIN_COVERAGE=70
CURRENT_COVERAGE=$(calculate_coverage)

echo "Current coverage: ${CURRENT_COVERAGE}%"
echo "Minimum required: ${MIN_COVERAGE}%"

if (( $(echo "$CURRENT_COVERAGE < $MIN_COVERAGE" | bc -l) )); then
  echo "❌ Coverage ${CURRENT_COVERAGE}% is below minimum ${MIN_COVERAGE}%"
  exit 1
else
  echo "✅ Coverage check passed!"
  exit 0
fi
