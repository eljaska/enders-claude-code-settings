# Ender's Claude Code Marketplace

Personal Claude Code marketplace containing custom plugins and configurations for enhanced development workflows.

## Installation

Add this marketplace to your Claude Code installation:

```bash
claude plugin marketplace add enders-marketplace \
  --source github \
  --repo eljaska/enders-claude
```

## Available Plugins

### enders-claude

Comprehensive Claude Code configuration with Starburst/Trino conventions, auto-installs required plugins, and includes extensive feature documentation.

**Quick Install:**
```bash
claude plugin install enders-claude@enders-marketplace
```

**Features:**
- 📚 **Complete Documentation**: Guides for all 8 major Claude Code features
- 🛠️ **Starter Skills**: Trino code review, git commit helper
- 🔌 **Auto-Installation**: Automatically installs pr-review-toolkit, security-guidance, and code-review on first launch
- 📖 **Best Practices**: Trino/Java coding conventions, Chris Beams commit guide
- ⚙️ **Example Configs**: CLAUDE.md and MCP configuration templates

**What's Included:**
- Learning paths for beginners to advanced users
- Integration patterns and examples
- Troubleshooting reference
- SessionStart hook for dependency management

See the [plugin README](./plugins/enders-claude/README.md) for detailed information.

## Installation Instructions

### Option 1: Install from Marketplace (Recommended)

```bash
# Add the marketplace
claude plugin marketplace add enders-marketplace \
  --source github \
  --repo eljaska/enders-claude

# Install the plugin
claude plugin install enders-claude@enders-marketplace
```

### Option 2: Install Directly from GitHub

```bash
# Clone the repository
git clone https://github.com/eljaska/enders-claude.git

# Install locally
cd enders-claude
claude --plugin-dir plugins/enders-claude
```

## What Happens on First Launch

When you install the plugin and start a Claude Code session:

1. **Plugin loads** and registers skills
2. **SessionStart hook** automatically installs dependencies:
   - `pr-review-toolkit` - Pull request review tools
   - `security-guidance` - Security best practices
   - `code-review` - Code review workflows
3. **Flag file** created at `~/.claude/enders-claude-deps-installed` to prevent re-installation
4. **Skills available**: `/commit-helper` and `/trino-review`

## Usage

### Using the Skills

**Manual invocation:**
```bash
/commit-helper  # Git commit helper
/trino-review   # Trino code review
```

**Automatic invocation:**
- Claude will automatically use `trino-review` when you ask for code reviews
- Skills are context-aware and trigger based on your requests

## Updating

Keep the plugin up to date:

```bash
claude plugin update enders-claude
```

## Plugin Structure

```
enders-claude/                 # Marketplace root
├── plugins/
│   └── enders-claude/        # The plugin
│       ├── .claude-plugin/   # Plugin manifest
│       ├── skills/           # Custom skills
│       ├── hooks/            # Auto-installer hook
│       ├── docs/             # Feature documentation
│       ├── CLAUDE.md         # Example conventions
│       ├── .mcp.json         # Example MCP config
│       └── README.md         # Plugin documentation
├── README.md                  # This file (marketplace info)
└── LICENSE                    # MIT License
```

## For Colleagues at Starburst

This marketplace is tailored for Starburst development workflows with Trino conventions. Install with:

```bash
claude plugin marketplace add enders-marketplace --source github --repo eljaska/enders-claude
claude plugin install enders-claude@enders-marketplace
```

The plugin will automatically configure your environment with:
- Trino code style guidelines
- Proper git commit formatting
- Required review and security plugins

## Development

### Testing Locally

```bash
# Clone the repository
git clone https://github.com/eljaska/enders-claude.git
cd enders-claude

# Test the plugin
claude --plugin-dir plugins/enders-claude

# Validate plugin structure
cd plugins/enders-claude
claude plugin validate .
```

### Contributing

This is a personal configuration repository. Feel free to fork and customize for your own needs.

## License

MIT License - See [LICENSE](./LICENSE) for details.

## Author

Ender Jaska (ender.jaska@starburstdata.com)

## Support

For issues or questions:
- Open an issue on [GitHub](https://github.com/eljaska/enders-claude/issues)
- Review the plugin documentation in `plugins/enders-claude/README.md`
- Check the feature documentation in `plugins/enders-claude/docs/`
