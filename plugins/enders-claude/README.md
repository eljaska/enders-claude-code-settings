# Ender's Claude Code Settings

A comprehensive Claude Code plugin providing:
- 📚 Extensive documentation for all Claude Code features
- 🛠️ Starter skills and configurations (Trino/Java focused)
- 🔌 Auto-installation of recommended plugins
- 📖 Best practices and examples

## Quick Start

### Installation

Install the plugin with a single command:

```bash
claude plugin install enders-claude@your-marketplace
```

**What happens on first launch:**
1. Plugin loads and registers skills
2. SessionStart hook automatically installs dependencies:
   - `pr-review-toolkit` - Pull request review tools
   - `security-guidance` - Security best practices
   - `code-review` - Code review workflows
3. Flag file created to prevent re-installation
4. You're ready to go!

**Manual dependency installation:**
If you prefer to install dependencies yourself:
```bash
claude plugin install pr-review-toolkit --scope user
claude plugin install security-guidance --scope user
claude plugin install code-review --scope user
```

## What's Included

### Documentation (docs/)
- Complete guides for all 8 major Claude Code features
- Learning paths for beginners to advanced users
- Integration patterns and examples
- Troubleshooting reference

See [docs/README.md](./docs/README.md) for the full documentation index.

### Skills
- **trino-review** - Code review using Trino project conventions
- **commit-helper** - Git commits following Chris Beams guide

### Configuration Examples
- `CLAUDE.md` - Project convention template (Trino/Java style)
- `.mcp.json` - MCP server configuration example
- `hooks/` - Auto-dependency installer hook

## Usage

### Using Skills

**Manual invocation:**
```bash
/commit-helper
/trino-review
```

**Automatic invocation:**
- Claude will use `trino-review` when you ask for code reviews
- Skills are context-aware and trigger based on your requests

### Customization

**Add your own skills:**
```bash
# In your project
mkdir -p .claude/skills/my-skill
# Create SKILL.md with frontmatter
```

**Override conventions:**
- Create your own `CLAUDE.md` at project or user level
- Add to `.claude/settings.json` for project-specific settings

## Development

### Testing the Plugin Locally

```bash
# Clone the repository
git clone https://github.com/eljaska/enders-claude.git
cd enders-claude

# Load plugin for current session
claude --plugin-dir .

# Validate plugin structure
claude plugin validate .
```

### Plugin Structure

```
enders-claude/
├── .claude-plugin/
│   └── plugin.json           # Plugin manifest
├── skills/                   # Skills (auto-discovered)
│   ├── trino-review/
│   └── commit-helper/
├── hooks/
│   ├── hooks.json           # Hook configuration
│   └── install-dependencies.sh  # Auto-installer
├── docs/                     # Feature documentation
├── CLAUDE.md                 # Example conventions
├── .mcp.json                 # Example MCP config
└── README.md                 # This file
```

## Documentation

Full documentation available in the [docs/](./docs/) directory:

1. [CLAUDE.md - Persistent Memory](./docs/1.%20CLAUDE.md.md)
2. [Skills - Reusable Workflows](./docs/2.%20Skills.md)
3. [Subagents - Specialized Assistants](./docs/3.%20Subagents.md)
4. [Hooks - Deterministic Automation](./docs/4.%20Hooks.md)
5. [MCP - Model Context Protocol](./docs/5.%20MCP.md)
6. [Checkpoints - Session Version Control](./docs/6.%20Checkpoints.md)
7. [Output Styles - Response Customization](./docs/7.%20Output%20Styles.md)
8. [Built-in Commands - CLI Reference](./docs/8.%20Built-in%20Commands.md)

## License

MIT License - See [LICENSE](./LICENSE) for details.

## Author

Ender Jaska (ender.jaska@starburstdata.com)

## Contributing

This plugin is tailored for Starburst development workflows. Feel free to fork and customize for your own needs.

## Support

For issues or questions:
- Open an issue on [GitHub](https://github.com/eljaska/enders-claude/issues)
- Review the documentation in `docs/`
