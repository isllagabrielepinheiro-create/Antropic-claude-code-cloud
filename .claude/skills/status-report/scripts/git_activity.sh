#!/usr/bin/env bash
# Summarize git activity over a period, as raw material for a status report.
# Not a report by itself — group and summarize its output, don't paste it verbatim.
#
# Usage: git_activity.sh [--since <git-date-spec>] [--until <git-date-spec>] [--author <name-or-email>]
#   Defaults: --since "7 days ago" --until now, all authors.
#   Examples of valid date specs: "2026-08-01", "2 weeks ago", "yesterday".
#
# Run from inside the repository (or any subdirectory of it).

set -euo pipefail

SINCE="7 days ago"
UNTIL="now"
AUTHOR=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --since) SINCE="$2"; shift 2 ;;
    --until) UNTIL="$2"; shift 2 ;;
    --author) AUTHOR="$2"; shift 2 ;;
    -h|--help)
      grep '^#' "$0" | sed 's/^#//; s/^ //'
      exit 0
      ;;
    *)
      echo "Unknown argument: $1" >&2
      exit 1
      ;;
  esac
done

AUTHOR_ARGS=()
if [[ -n "$AUTHOR" ]]; then
  AUTHOR_ARGS=(--author="$AUTHOR")
fi

if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "Not inside a git repository." >&2
  exit 1
fi

echo "## Commits (${SINCE} -> ${UNTIL})"
git log --since="$SINCE" --until="$UNTIL" "${AUTHOR_ARGS[@]}" \
  --pretty=format:'- %ad  %an: %s' --date=short
echo
echo
echo "## Commit count by author"
git log --since="$SINCE" --until="$UNTIL" "${AUTHOR_ARGS[@]}" \
  --pretty=format:'%an' | sort | uniq -c | sort -rn
echo
echo "## Most-changed files"
git log --since="$SINCE" --until="$UNTIL" "${AUTHOR_ARGS[@]}" \
  --name-only --pretty=format: | sed '/^$/d' | sort | uniq -c | sort -rn | head -20
echo
echo "## Open branches touched in the period"
git for-each-ref --format='%(committerdate:short) %(refname:short)' refs/heads/ \
  | awk -v since="$(date -d "$SINCE" +%Y-%m-%d 2>/dev/null || date -v-7d +%Y-%m-%d)" '$1 >= since'
