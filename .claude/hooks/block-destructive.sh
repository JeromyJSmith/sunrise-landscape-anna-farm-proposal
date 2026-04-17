#!/bin/bash
# Anna's Farm 3D Editor — PreToolUse hook: block destructive bash commands.
# Exit 2 = block (stderr shown to Claude). Exit 0 = allow.

INPUT=$(cat)
CMD=$(echo "$INPUT" | python3 -c "import sys,json; d=json.load(sys.stdin); print(d.get('tool_input',{}).get('command',''))" 2>/dev/null)

if [ -z "$CMD" ]; then exit 0; fi

# Destructive filesystem
if echo "$CMD" | grep -Eq '(^|[^a-zA-Z])rm[[:space:]]+-rf[[:space:]]+(/|~|\$HOME)'; then
  echo "BLOCKED: destructive rm against root/home." >&2
  exit 2
fi

if echo "$CMD" | grep -Eq '^[[:space:]]*sudo[[:space:]]'; then
  echo "BLOCKED: sudo requires explicit user approval." >&2
  exit 2
fi

# Git safety
if echo "$CMD" | grep -Eq 'git[[:space:]]+push[[:space:]]+.*--force'; then
  echo "BLOCKED: force-push requires explicit user approval." >&2
  exit 2
fi

if echo "$CMD" | grep -Eq 'git[[:space:]]+reset[[:space:]]+--hard'; then
  echo "BLOCKED: git reset --hard destroys work. Ask the user first." >&2
  exit 2
fi

# Curl-to-shell
if echo "$CMD" | grep -Eq '(curl|wget)[[:space:]]+.*\|[[:space:]]*(bash|sh)'; then
  echo "BLOCKED: pipe-to-shell is disallowed. Download, inspect, then run." >&2
  exit 2
fi

# Protect the base scene GLB from accidental deletion
if echo "$CMD" | grep -Eq 'rm.*anna_scene\.glb'; then
  echo "BLOCKED: cannot delete the base scene GLB. This is the source model." >&2
  exit 2
fi

exit 0
