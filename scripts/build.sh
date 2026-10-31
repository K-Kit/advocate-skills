#!/usr/bin/env bash
# Package every skill (any top-level folder with SKILL.md) for non-technical install:
#   dist/<skill>.zip               upload to Claude (Customize > Skills) or ChatGPT (Plugins > Skills)
#   dist/<skill>-instructions.md   single file for ChatGPT/Claude Projects (any plan)
set -euo pipefail

root="$(cd "$(dirname "$0")/.." && pwd)"
dist="$root/dist"
rm -rf "$dist"
mkdir -p "$dist"
cd "$root"

built=0
for skill_md in */SKILL.md; do
  dir="${skill_md%/SKILL.md}"
  name="$(sed -n 's/^name:[[:space:]]*//p' "$skill_md" | head -n1 | tr -d '"')"
  desc="$(sed -n 's/^description:[[:space:]]*//p' "$skill_md" | head -n1 | sed 's/^"//; s/"$//')"

  # Claude.ai rejects uploads whose folder name differs from the skill name and caps descriptions at 200 chars.
  if [[ "$name" != "$dir" ]]; then
    echo "error: $skill_md name '$name' must match folder '$dir'" >&2; exit 1
  fi
  if ! [[ "$name" =~ ^[a-z0-9-]{1,64}$ ]]; then
    echo "error: $skill_md name '$name' must be lowercase letters, digits, hyphens (max 64)" >&2; exit 1
  fi
  if (( ${#desc} == 0 || ${#desc} > 200 )); then
    echo "error: $skill_md description is ${#desc} chars; Claude.ai requires 1-200" >&2; exit 1
  fi

  # ZIP root must be the skill folder itself.
  zip -qr "$dist/$name.zip" "$dir" -x '*/.DS_Store' '*/__MACOSX/*'

  # Projects version: SKILL.md body without frontmatter, reference links pointed at the appended text.
  out="$dist/$name-instructions.md"
  awk 'BEGIN{fm=0} fm<2 && /^---[[:space:]]*$/ {fm++; next} fm>=2' "$skill_md" \
    | sed -E 's/\[([^]]+)\]\(references\/[^)]+\)/\1 (included at the end of these instructions)/g' > "$out"
  for ref in "$dir"/references/*.md; do
    [[ -e "$ref" ]] || continue
    printf '\n---\n\n<!-- %s -->\n' "${ref#"$dir"/}" >> "$out"
    cat "$ref" >> "$out"
  done

  echo "built $name: $(basename "$dist/$name.zip"), $(basename "$out")"
  built=$((built + 1))
done

(( built > 0 )) || { echo "error: no */SKILL.md found" >&2; exit 1; }
