#!/bin/bash
TLDS="com net cc top live online site digital world vip win io"
for base in "$@"; do
  for t in $TLDS; do
    d="$base.$t"
    ip=$(dig +short @1.1.1.1 "$d" 2>/dev/null | grep -E '^[0-9]' | head -1)
    if [ -z "$ip" ]; then
      printf "%-26s NO-DNS\n" "$d"
    else
      cm=$(curl -s -m 8 -I "https://$d/" 2>/dev/null | grep -i '^cast-mode:' | tr -d '\r' | awk '{print $2}')
      vj=$(curl -s -m 8 -o /dev/null -w "%{http_code}" "https://$d/verifyjs" 2>/dev/null)
      printf "%-26s ip=%-15s cast=%-9s vjs=%s\n" "$d" "$ip" "$cm" "$vj"
    fi
  done
done
