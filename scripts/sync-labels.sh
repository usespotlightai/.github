#!/usr/bin/env bash
# Usage: scripts/sync-labels.sh [repo...]   (default: every active repo in the org)
set -euo pipefail
org=usespotlightai
here=$(cd "$(dirname "$0")/.." && pwd)
repos=("$@")
if [ ${#repos[@]} -eq 0 ]; then
  mapfile -t repos < <(gh repo list "$org" --limit 100 --json name,isArchived -q '.[]|select(.isArchived|not)|.name')
fi
apply() {
  local repo=$1 file=$2
  while IFS=$'\t' read -r name color description; do
    [ -z "$name" ] && continue
    gh label create "$name" -R "$org/$repo" --color "$color" --description "$description" --force >/dev/null
  done < "$file"
}
for repo in "${repos[@]}"; do
  [ "$repo" = ".github" ] && continue
  apply "$repo" "$here/labels/all.tsv"
  [ -f "$here/labels/$repo.tsv" ] && apply "$repo" "$here/labels/$repo.tsv"
  echo "synced $repo"
done
