#!/bin/bash
for d in "$@"; do
  ip=$(dig +short @1.1.1.1 "$d" 2>/dev/null | head -1)
  if [ -z "$ip" ]; then printf "%-24s NO-DNS\n" "$d"; else
    code=$(curl -s -m 10 -o /dev/null -w "%{http_code}" "https://$d/" 2>/dev/null)
    cm=$(curl -s -m 10 -I "https://$d/" 2>/dev/null | grep -i '^cast-mode:' | tr -d '\r' | awk '{print $2}')
    vj=$(curl -s -m 10 -o /dev/null -w "%{http_code}" "https://$d/verifyjs" 2>/dev/null)
    printf "%-24s ip=%-15s status=%-5s cast=%-9s vjs=%s\n" "$d" "$ip" "$code" "$cm" "$vj"
  fi
  sleep 0.2
done
