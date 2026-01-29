# Claude Code Feature Documentation

Complete reference documentation for Claude Code's major features and components.

## Quick Navigation

1. [CLAUDE.md - Persistent Memory](./1.%20CLAUDE.md.md)
2. [Skills - Reusable Workflows](./2.%20Skills.md)
3. [Subagents - Specialized Assistants](./3.%20Subagents.md)
4. [Hooks - Deterministic Automation](./4.%20Hooks.md)
5. [MCP - Model Context Protocol](./5.%20MCP.md)
6. [Checkpoints - Session-Level Version Control](./6.%20Checkpoints.md)
7. [Output Styles - Customize Response Format](./7.%20Output%20Styles.md)
8. [Built-in Commands - Core CLI Tools](./8.%20Built-in%20Commands.md)

## Plugin Installation

This documentation is also available as a Claude Code plugin with starter configurations.

**Install:**
```bash
claude plugin install enders-claude
```

**What you get:**
- All this documentation accessible within Claude Code
- Starter skills (Trino code review, git commit helper)
- Auto-installation of recommended plugins
- Example configurations (CLAUDE.md, .mcp.json)

See the [root README](../README.md) for full plugin details.

---

## Learning Path

### For Beginners

Start with these foundational features to customize Claude's behavior:

1. **[CLAUDE.md](./1.%20CLAUDE.md.md)** - Learn to provide persistent instructions and project context
2. **[Skills](./2.%20Skills.md)** - Create reusable workflows and domain knowledge packages
3. **[Built-in Commands](./8.%20Built-in%20Commands.md)** - Master the CLI and essential commands

**Why start here**: These features provide immediate value and help you understand how Claude Code can be customized to your workflow.

### For Intermediate Users

After mastering the basics, explore these powerful automation features:

4. **[Subagents](./3.%20Subagents.md)** - Deploy specialized AI workers that run in parallel
5. **[Hooks](./4.%20Hooks.md)** - Add automatic behavior at lifecycle events
6. **[MCP](./5.%20MCP.md)** - Connect external tools, databases, and services

**Why next**: These features multiply your effectiveness by automating repetitive tasks and extending Claude's reach into your existing toolchain.

### For Advanced Users

Complete your mastery with advanced customization:

7. **[Checkpoints](./6.%20Checkpoints.md)** - Advanced session control with undo/rewind capability
8. **[Output Styles](./7.%20Output%20Styles.md)** - Full response format customization

**Why last**: These features fine-tune the experience once you understand the fundamentals.

## Feature Comparison Matrix

| Feature | Scope | Invocation | Configuration | Use Case | Isolation |
|---------|-------|------------|---------------|----------|-----------|
| **CLAUDE.md** | Global/Project | Automatic (startup) | Markdown files | Persistent instructions, code style, conventions | Shared context |
| **Skills** | Project/Personal | User (`/skill`) or Claude | SKILL.md with frontmatter | Reusable workflows, domain knowledge | Optional (fork mode) |
| **Subagents** | On-demand | Claude delegates | Markdown with frontmatter | Parallel specialized tasks, high-volume operations | Isolated context |
| **Hooks** | Global/Project | Automatic (events) | JSON in settings | Intercept/modify behavior, validation, automation | Same process |
| **MCP** | Local/Project/User | Tool calls | `.mcp.json` or CLI | External service integration, database access | External process |
| **Checkpoints** | Session | User command | Built-in | Undo/rewind changes, experiment safely | N/A |
| **Output Styles** | Session | Startup/Command | Markdown files | Response format customization | Same context |
| **Commands** | Session | User | Built-in | CLI operations, configuration | Same process |

## When to Use Each Feature

### CLAUDE.md
**Use when**: You need context or instructions applied to every conversation.

**Examples**:
- Code style guidelines (Trino conventions, naming rules)
- Git commit message format (Chris Beams guide)
- Project-specific commands (build, test, deploy)
- Common abbreviations or terminology
- Architecture decisions

**Don't use for**: Information Claude can infer from code, long tutorials, frequently changing data

### Skills
**Use when**: You have repeatable workflows or domain knowledge to package.

**Examples**:
- `/commit` - Create git commits with proper formatting
- `/review` - Review pull requests with a checklist
- `/api-doc` - Generate API documentation
- `/new-component` - Scaffold new components from templates
- API design patterns (loaded automatically when relevant)

**Don't use for**: One-off tasks, instructions better suited for CLAUDE.md

### Subagents
**Use when**: You need specialized expertise, parallel execution, or want to keep verbose output separate.

**Examples**:
- Code reviewer running in parallel
- Security auditor with restricted tools (read-only)
- Test runner producing lots of output
- Database query analyzer
- Performance profiler

**Don't use for**: Simple tasks, when you want output in main conversation

### Hooks
**Use when**: You need guaranteed automation that always executes.

**Examples**:
- Auto-format files after editing (Prettier, Spotless)
- Block edits to sensitive files (`.env`, lock files)
- Run tests after code changes
- Log all bash commands for compliance
- Add context to every user prompt

**Don't use for**: Optional suggestions, when flexibility is needed

### MCP
**Use when**: You need Claude to access external services, databases, or tools.

**Examples**:
- Query production database (read-only)
- Fetch documentation for libraries (context7)
- Monitor errors (Sentry)
- Manage GitHub issues and PRs
- Browser automation (Playwright)
- Team communication (Slack)

**Don't use for**: Operations better handled by bash commands

### Checkpoints
**Use when**: You want to experiment without risk or need to undo recent changes.

**Examples**:
- Try different refactoring approaches
- Recover from failed experiments
- Compare alternative implementations
- Safely explore risky changes

**Don't use for**: Long-term version control (use Git)

### Output Styles
**Use when**: You need consistent response formatting or adapt Claude for non-engineering tasks.

**Examples**:
- Code reviewer style with structured feedback
- Technical writer style for documentation
- Data analyst style for SQL work
- Educator style with explanations

**Don't use for**: Temporary formatting changes

### Built-in Commands
**Use when**: You need to manage sessions, configure settings, or access core CLI features.

**Examples**:
- `/clear` - Start fresh conversation
- `/rewind` - Undo recent changes
- `/mcp` - Manage MCP servers
- `/hooks` - Configure hooks
- `/cost` - Check token usage

## Integration Patterns

### Pattern 1: Project-Specific Workflow
```
CLAUDE.md (project conventions)
  ↓
Skills (repeatable tasks: /commit, /review)
  ↓
Hooks (auto-format, run tests)
  ↓
MCP (GitHub integration, database access)
```

**Example**: Trino development workflow with Java conventions in CLAUDE.md, `/review` skill for PR reviews, Spotless auto-formatting hook, and GitHub MCP for issue management.

### Pattern 2: Specialized Review Pipeline
```
Main Claude (code implementation)
  ↓
Subagent: code-reviewer (parallel review)
  ↓
Subagent: security-reviewer (security audit)
  ↓
Hook: auto-format (clean up)
```

**Example**: Write code in main session, automatically trigger reviewers in parallel, apply formatting before commit.

### Pattern 3: External Data Integration
```
MCP (database connection)
  ↓
Skill (analysis workflow)
  ↓
Output Style (formatted reports)
```

**Example**: Connect to analytics database via MCP, use `/analyze` skill to run queries, apply data-analyst output style for consistent report formatting.

### Pattern 4: Team Collaboration
```
.claude/CLAUDE.md (shared conventions)
.claude/skills/ (team workflows)
.mcp.json (team integrations)
.claude/settings.json (shared hooks)
```

**Example**: Entire team shares same configuration checked into version control, ensuring consistency.

## Examples Directory

The `examples/` directory contains ready-to-use configurations for each feature:

- **`examples/claude-md/`** - Sample CLAUDE.md files for different project types
- **`examples/skills/`** - Complete skill implementations with frontmatter
- **`examples/subagents/`** - Specialized subagent templates
- **`examples/hooks/`** - Hook configurations for common use cases
- **`examples/mcp/`** - MCP server configuration examples

## Architecture Overview

### Context Flow

```
User Prompt
  ↓
UserPromptSubmit Hooks (can add context, block)
  ↓
Claude receives:
  - CLAUDE.md content (loaded at startup)
  - Relevant Skills descriptions (matched by Claude)
  - Conversation history
  - File contents from Read tool
  ↓
Claude decides to:
  - Use tools directly
  - Invoke Skills (/skill-name or automatic)
  - Delegate to Subagents (isolated context)
  - Query MCP servers (external data)
  ↓
PreToolUse Hooks (can block, modify, validate)
  ↓
Tool executes
  ↓
PostToolUse Hooks (formatting, testing, logging)
  ↓
Response to user
  ↓
Stop Hooks (session cleanup, notifications)
```

### Scope Hierarchy

**Load Order** (higher priority overrides lower):
1. Session-specific (output style, permissions)
2. Local project (`.claude/settings.local.json`, not committed)
3. Project (`.claude/`, checked into git)
4. Personal global (`~/.claude/`)
5. System/Enterprise (managed centrally)

**MCP Servers**:
- Local scope > Project scope > User scope

**Skills**:
- Enterprise > Personal > Project > Plugin

**Hooks**:
- Settings loaded at startup (changes require restart)

## Best Practices Summary

### Do's
- ✅ Keep CLAUDE.md concise (under 500 lines)
- ✅ Use Skills for repeatable workflows
- ✅ Restrict Subagent tools appropriately
- ✅ Test Hooks manually before deploying
- ✅ Use project-scoped MCP for team tools
- ✅ Commit shared configurations to version control
- ✅ Document your customizations
- ✅ Review Checkpoints before deleting work

### Don'ts
- ❌ Don't put secrets in CLAUDE.md or committed configs
- ❌ Don't create Skills for one-off tasks
- ❌ Don't give Subagents more permissions than needed
- ❌ Don't use Hooks for operations that should be optional
- ❌ Don't connect MCP servers without verifying source
- ❌ Don't rely on Checkpoints for long-term version control
- ❌ Don't over-engineer simple workflows

## Troubleshooting Quick Reference

| Problem | Check | Solution |
|---------|-------|----------|
| CLAUDE.md changes not applied | Session restart | Restart Claude Code session |
| Skill not appearing | Skill name, file location | Check frontmatter `name` field, ensure in `.claude/skills/` |
| Subagent failing | Tool restrictions | Review `tools` and `disallowedTools` |
| Hook not firing | Matcher pattern, hook event | Verify matcher case-sensitivity, restart session |
| MCP server not working | Authentication, scope | Run `/mcp` to authenticate, check `.mcp.json` |
| Checkpoint not available | Bash file changes | Only Edit/Write tools tracked |
| Output style not applied | Keep-coding-instructions | Set `keep-coding-instructions: true` |
| Command not found | Built-in vs skill | Use `/help` to list available commands |

## Security Considerations

### CLAUDE.md
- Don't commit secrets, API keys, or credentials
- Avoid exposing internal architecture details in public repos
- Review before sharing with team

### Skills
- Use `disable-model-invocation: true` for commands with side effects
- Validate user input in skill scripts
- Restrict tool access when possible

### Subagents
- Minimum necessary permissions (principle of least privilege)
- Read-only tools for reviewers
- Never allow sensitive data access without authentication

### Hooks
- Validate all inputs (prevent injection attacks)
- Quote variables properly: `"$VAR"` not `$VAR`
- Avoid wildcards in file path matchers
- Test hooks before production use
- Block sensitive files (`.env`, `.git/`, credentials)

### MCP
- Verify MCP server source before installation
- Use read-only database credentials
- Never hardcode secrets (use environment variables)
- Review OAuth scopes carefully
- Monitor for unusual activity

## Contributing

This documentation is maintained as a living resource. Each feature document follows a standard structure for consistency:

1. Overview
2. Key Concepts
3. How It Works
4. Configuration
5. Usage Patterns
6. Examples
7. Best Practices
8. Common Patterns
9. Gotchas and Troubleshooting
10. API Reference
11. Related Features
12. Additional Resources

## Additional Resources

- **Official Documentation**: https://docs.anthropic.com/claude/docs/claude-code
- **Claude Code GitHub**: https://github.com/anthropics/claude-code
- **Agent Skills Standard**: https://agentskills.io
- **MCP Protocol**: https://modelcontextprotocol.io
- **Community Plugins**: https://claude.ai/plugins

## Version Information

This documentation covers Claude Code features as of January 2025. Features and APIs may evolve over time.

---

**Ready to get started?** Begin with [CLAUDE.md](./1.%20CLAUDE.md.md) to learn how to customize Claude's persistent memory.
