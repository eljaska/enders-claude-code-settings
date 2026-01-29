#!/bin/bash
set -e

# Flag file to track if dependencies are installed
FLAG_FILE="$HOME/.claude/enders-claude-deps-installed"

# Only run on first launch (idempotent check)
if [ -f "$FLAG_FILE" ]; then
  exit 0
fi

echo "🔧 Installing required plugins for Ender's Claude configuration..."

# Install required external plugins (idempotent - won't fail if already installed)
echo "  📦 Installing pr-review-toolkit..."
claude plugin install pr-review-toolkit --scope user 2>&1 | grep -v "Already installed" || true

echo "  📦 Installing security-guidance..."
claude plugin install security-guidance --scope user 2>&1 | grep -v "Already installed" || true

echo "  📦 Installing code-review..."
claude plugin install code-review --scope user 2>&1 | grep -v "Already installed" || true

# Mark as installed
mkdir -p "$HOME/.claude"
touch "$FLAG_FILE"
echo "✅ All plugin dependencies installed successfully!"

exit 0
