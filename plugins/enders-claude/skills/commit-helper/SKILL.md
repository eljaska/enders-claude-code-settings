---
name: commit-helper
description: Create git commits following the Chris Beams guide. Use when creating commits or reviewing commit messages.
disable-model-invocation: true
tools: Bash, Read, Grep
---

# Git Commit Helper

Create commits following the Chris Beams guide:

## Workflow

### Step 1: Review Changes
Run in parallel:
```bash
git status
git diff --staged
git diff
git log -5 --oneline
```

### Step 2: Analyze Changes
Understand:
- What changed (files, functions, logic)
- Why it changed (bug fix, feature, refactor)
- Impact (breaking changes, new functionality)

### Step 3: Draft Commit Message

**Format:**
```
<Subject line>

<Body>

Co-Authored-By: Claude (us.anthropic.claude-sonnet-4-5-20250929-v1:0) <noreply@anthropic.com>
```

**The Seven Rules:**
1. Separate subject from body with blank line
2. Limit subject line to 50 characters
3. Capitalize the subject line
4. Do not end subject line with period
5. Use imperative mood ("Add feature" not "Added feature")
6. Wrap body at 72 characters
7. Use body to explain what and why (not how)

### Step 4: Stage and Commit

```bash
git add <specific files>
git commit -m "$(cat <<'EOF'
<commit message>
EOF
)"
git status
```

**Important:**
- Never stage secrets (.env, credentials, keys)
- Use specific files, not `git add -A`
