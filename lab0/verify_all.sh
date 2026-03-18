#!/usr/bin/env bash
set -euo pipefail

LAB0_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ARTIFACT_DIR="$LAB0_DIR/docs/artifacts"
EXPECTED_FINAL="11 12 22 25 34 64 90"
RUN_PERF=1

for arg in "$@"; do
  case "$arg" in
    --skip-perf)
      RUN_PERF=0
      ;;
    *)
      echo "Unknown option: $arg"
      echo "Usage: ./verify_all.sh [--skip-perf]"
      exit 1
      ;;
  esac
done

mkdir -p "$ARTIFACT_DIR"
cd "$LAB0_DIR"

echo "[1/6] make(old) clean + build + run"
make -f Makefile.old clean
make -f Makefile.old
NORMAL_OUT="$(./bubble_sort | tee "$ARTIFACT_DIR/run-make.txt")"
NORMAL_FINAL="$(printf '%s\n' "$NORMAL_OUT" | tail -n 1 | sed 's/[[:space:]]*$//')"
if [[ "$NORMAL_FINAL" != "$EXPECTED_FINAL" ]]; then
  echo "ERROR: normal mode final output mismatch: $NORMAL_FINAL"
  exit 1
fi

echo "[2/6] make(old) debug + run"
make -f Makefile.old debug
DEBUG_OUT="$(./bubble_sort | tee "$ARTIFACT_DIR/run-make-debug.txt")"
DEBUG_FINAL="$(printf '%s\n' "$DEBUG_OUT" | tail -n 1 | sed 's/[[:space:]]*$//')"
DEBUG_LINES="$(printf '%s\n' "$DEBUG_OUT" | wc -l)"
if [[ "$DEBUG_FINAL" != "$EXPECTED_FINAL" ]]; then
  echo "ERROR: debug mode final output mismatch: $DEBUG_FINAL"
  exit 1
fi
if [[ "$DEBUG_LINES" -le 1 ]]; then
  echo "ERROR: debug mode did not print intermediate swap states"
  exit 1
fi

echo "[3/6] make(old) clean"
make -f Makefile.old clean

echo "[4/6] cmake build + run"
cd "$LAB0_DIR/build"
cmake --build .
CMAKE_OUT="$(./bubble_sort | tee "$ARTIFACT_DIR/run-cmake.txt")"
CMAKE_FINAL="$(printf '%s\n' "$CMAKE_OUT" | tail -n 1 | sed 's/[[:space:]]*$//')"
if [[ "$CMAKE_FINAL" != "$EXPECTED_FINAL" ]]; then
  echo "ERROR: cmake mode final output mismatch: $CMAKE_FINAL"
  exit 1
fi

if [[ "$RUN_PERF" -eq 1 ]]; then
  echo "[5/6] perf stat"
  if command -v sudo >/dev/null 2>&1; then
    sudo perf stat ./bubble_sort 2>&1 | tee "$ARTIFACT_DIR/perf-stat.txt"
  else
    perf stat ./bubble_sort 2>&1 | tee "$ARTIFACT_DIR/perf-stat.txt"
  fi

  if ! grep -q "task-clock" "$ARTIFACT_DIR/perf-stat.txt"; then
    echo "ERROR: perf output does not contain task-clock"
    exit 1
  fi
else
  echo "[5/6] perf stat skipped"
fi

echo "[6/6] summary"
echo "All checks passed."
echo "Artifacts written to: $ARTIFACT_DIR"
