#!/bin/bash
# Anna's Farm 3D Editor — PostToolUse hook: log file edits for traceability.
# Non-blocking. Silent on success.

INPUT=$(cat)
FILE=$(echo "$INPUT" | python3 -c "import sys,json; d=json.load(sys.stdin); print(d.get('tool_input',{}).get('file_path',''))" 2>/dev/null)

if [ -z "$FILE" ]; then exit 0; fi

LOG="${CLAUDE_PROJECT_DIR:-.}/.claude/edit-log.ndjson"
TS=$(date -u +%Y-%m-%dT%H:%M:%SZ)
echo "{\"ts\":\"$TS\",\"file\":\"$FILE\"}" >> "$LOG"

exit 0
