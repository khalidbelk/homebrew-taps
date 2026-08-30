#!/bin/sh

usage() {
  echo "Usage: $0 <formula> <style|audit|install|test|all>" >&2
  exit 1
}

[ $# -eq 2 ] || usage

formula="$1"
action="$2"
qualified="khalidbelk/taps/$formula"
file="Formula/$formula.rb"

[ -f "$file" ] || { echo "Error: $file not found" >&2; exit 1; }

install_or_reinstall() {
  if brew list --formula "$qualified" >/dev/null 2>&1; then
    brew reinstall "$qualified"
  else
    brew install "$qualified"
  fi
}

all() {
    echo "[----- STYLE CHECK -----]\n"
    brew style "$file"
    echo "\n"

    echo "[-----  AUDITING   -----]\n"
    brew audit --strict --online "$qualified"

    echo "[-----  INSTALLING  -----]\n"
    install_or_reinstall
    echo "\n"

    echo "[-----  TESTING  -----]\n"
    brew test "$qualified"
}

case "$action" in
  style)
    brew style "$file"
    ;;
  audit)
    brew audit --strict --online "$qualified"
    ;;
  install)
    install_or_reinstall
    ;;
  test)
    install_or_reinstall
    brew test "$qualified"
    ;;
  all) all ;;
  *)
    usage
    ;;
esac
