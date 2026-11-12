#!/bin/bash
# Outside checks for SCALVS Russia (scalvs-russia). Exits non-zero if any check fails.
set -uo pipefail
SITE=${1:-https://ru.scalvs.app}
fail=0
check() { local got; got=$(curl -s -o /dev/null -w '%{http_code}' --max-time 20 --retry 3 "$3")
  if [ "$got" = "$2" ]; then echo "ok   $1 ($got)"; else echo "FAIL $1: got $got, want $2"; fail=1; fi; }
check "home"                    200 "$SITE/"
check "privacy"                 200 "$SITE/privacy.html"
check "http redirects to https" 301 "${SITE/https:/http:}/"
exit $fail
