#!/bin/bash
for d in "$@"; do
  code=$(curl -s -m 10 -o /dev/null -w "%{http_code}" "https://$d/" 2>/dev/null)
  cm=$(curl -s -m 10 -I "https://$d/" 2>/dev/null | grep -i '^cast-mode:' | tr -d '\r' | awk '{print $2}')
  vj=$(curl -s -m 10 -o /dev/null -w "%{http_code}" "https://$d/verifyjs" 2>/dev/null)
  printf "%-22s status=%-5s cast-mode=%-10s verifyjs=%s\n" "$d" "$code" "$cm" "$vj"
  sleep 0.3
done
