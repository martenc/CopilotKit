# Fork Sync Documentation

This fork of CopilotKit is kept up-to-date with the upstream repository [CopilotKit/CopilotKit](https://github.com/CopilotKit/CopilotKit).

## Automatic Sync

Use the provided sync script to easily update this fork:

```bash
./sync-upstream.sh
```

This script will:
1. Add the upstream remote (if not already present)
2. Fetch the latest changes from upstream
3. Create or update the `main` branch to match upstream
4. Preserve your current working branch

## Manual Sync

If you prefer to sync manually:

```bash
# Add upstream remote (only needed once)
git remote add upstream https://github.com/CopilotKit/CopilotKit.git

# Fetch latest changes
git fetch upstream

# Update main branch
git checkout main
git merge upstream/main --ff-only

# Push to your fork
git push origin main
```

## Checking for Updates

To see what's new in upstream:

```bash
git fetch upstream
git log --oneline main..upstream/main
```

## Build and Test

After syncing, verify everything works:

```bash
cd CopilotKit
pnpm install
pnpm build
pnpm test
```

## Important Notes

- This fork tracks the `main` branch of the upstream repository
- Feature branches from upstream are available but not automatically synced
- Always test your changes after syncing with upstream
- The sync script preserves your current working branch