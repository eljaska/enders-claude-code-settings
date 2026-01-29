# Starburst/Trino Development Conventions

## Git Commit Messages

Follow the Chris Beams guide:
1. Separate subject from body with a blank line
2. Limit subject line to 50 characters
3. Capitalize the subject line
4. Do not end subject line with a period
5. Use imperative mood ("Add feature" not "Added feature")
6. Wrap body at 72 characters
7. Use body to explain what and why (not how)

## Java Code Style (Trino)

### Guiding Principles
- **Readability first**: Rules maintain readability. When in conflict, readability wins.
- **Consistency**: Keep code consistent with surrounding code.

### Formatting
- Use 4 spaces for indentation (no tabs)
- Opening braces on same line
- Line length limit of 140 characters
- Single blank line between methods

### Naming
- Classes: UpperCamelCase
- Methods/variables: lowerCamelCase
- Constants: UPPER_SNAKE_CASE
- **Avoid abbreviations**: No abbreviations except well-known (max, min, ttl)
- **Avoid "get" prefix**: Use specific verbs or omit "get" entirely

### Imports
- No wildcard imports
- Static imports for common utilities (checkArgument, requireNonNull, format)
- Group: Java standard → third-party → Trino
- Alphabetical order within groups

### Code Practices
- **Avoid `var`**: Do not use var for local variables
- Prefer `requireNonNull()` over manual null checks
- Use `checkArgument()` and `checkState()` for preconditions
- Mark fields `private final` when possible
- **Prefer Guava immutable collections**
- **Use streams appropriately** (avoid in performance-sensitive sections)
- **Prefer String formatting**: Use `format()` over concatenation
- **Avoid ternary operator** except for trivial expressions
- **Omit default in enum switches**: Catch missing cases

### Testing
- **Avoid mocking libraries**: Write mocks by hand
- **Use AssertJ** for complex assertions
- Maintain production quality for test code

## Documentation
- Javadoc for public APIs
- Inline comments only when intent not clear
- Focus on "why" rather than "what"
