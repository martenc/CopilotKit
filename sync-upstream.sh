#!/bin/bash

# Script to sync fork with upstream CopilotKit repository
# Usage: ./sync-upstream.sh

set -e

echo "🔄 Syncing fork with upstream CopilotKit repository..."

# Check if upstream remote exists, if not add it
if ! git remote | grep -q "upstream"; then
    echo "➕ Adding upstream remote..."
    git remote add upstream https://github.com/CopilotKit/CopilotKit.git
fi

# Fetch latest changes from upstream
echo "📥 Fetching latest changes from upstream..."
git fetch upstream

# Get current branch
CURRENT_BRANCH=$(git branch --show-current)
echo "📍 Current branch: $CURRENT_BRANCH"

# Sync main branch
echo "🔄 Syncing main branch..."
if git show-ref --verify --quiet refs/heads/main; then
    # Main branch exists, switch to it and pull latest
    git checkout main
    git merge upstream/main --ff-only
else
    # Create main branch from upstream
    git checkout -b main upstream/main
fi

# Switch back to original branch if it wasn't main
if [ "$CURRENT_BRANCH" != "main" ] && [ -n "$CURRENT_BRANCH" ]; then
    echo "🔙 Switching back to original branch: $CURRENT_BRANCH"
    git checkout "$CURRENT_BRANCH"
fi

echo "✅ Sync complete!"
echo "📊 Latest commit on main:"
git log main --oneline -1

echo ""
echo "💡 To push the updated main branch to your fork, run:"
echo "   git push origin main"
echo ""
echo "💡 To see what's new, run:"
echo "   git log --oneline main...HEAD"