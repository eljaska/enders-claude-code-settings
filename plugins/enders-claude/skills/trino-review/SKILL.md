---
name: trino-review
description: Review Java code following Trino project conventions. Use when reviewing Trino codebase changes, pull requests, or Java code in Trino style.
tools: Read, Grep, Glob, Bash
model: sonnet
---

# Trino Code Review Guidelines

Apply Trino project code style when reviewing code.

## Guiding Principles
- **Readability first**: When readability conflicts with rules, readability wins
- **Consistency**: Keep code consistent with surrounding code

## Code Style Checks

### Formatting
- [ ] 4 spaces for indentation (no tabs)
- [ ] Opening braces on same line
- [ ] Line length ≤ 140 characters
- [ ] Single blank line between methods

### Naming Conventions
- [ ] Classes: UpperCamelCase
- [ ] Methods/variables: lowerCamelCase
- [ ] Constants: UPPER_SNAKE_CASE
- [ ] **No abbreviations** (except well-known: max, min, ttl)
- [ ] **Avoid "get" prefix** - use specific verbs or omit

### Imports
- [ ] No wildcard imports
- [ ] Static imports for common utilities (checkArgument, requireNonNull, format)
- [ ] Grouped: Java standard → third-party → Trino
- [ ] Alphabetical within groups

### Code Practices
- [ ] **Avoid `var`** for local variables
- [ ] Use `requireNonNull()` over manual null checks
- [ ] Use `checkArgument()` and `checkState()` for preconditions
- [ ] Avoid unnecessary `this.` qualifier
- [ ] Mark fields `private final` when possible
- [ ] **Prefer Guava immutable collections** (not JDK unmodifiable)
- [ ] **Use streams appropriately** (avoid in performance-sensitive code)
- [ ] **Prefer String formatting**: Use `format()` over concatenation
- [ ] **Avoid ternary operator** except for trivial expressions
- [ ] **No default in enum switches** (to catch missing cases)

### Testing
- [ ] **Avoid mocking libraries** - write mocks by hand
- [ ] **Use AssertJ** for complex assertions
- [ ] Maintain production quality for test code

## Review Output Format

### Critical Issues
[Issues that must be fixed before merge - with file:line references]

### Warnings
[Issues that should be fixed but not blockers - with file:line references]

### Suggestions
[Optional improvements - with file:line references]

### Summary
[Overall assessment: Approve / Request Changes / Comment]
