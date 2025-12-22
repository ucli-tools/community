# Contributing to UCLI Tools

Thank you for your interest in contributing! This guide will help you get started with improving UCLI Tools.

## Ways to Contribute

### 1. Report Bugs

Found a bug in any tool? Help us fix it:

1. Check if the issue already exists in the relevant tool's [GitHub Issues](https://github.com/ucli-tools/TOOL_NAME/issues)
2. If not, create a new issue with:
   - Clear description of the problem
   - Steps to reproduce
   - Expected vs actual behavior
   - Your environment (OS, versions, etc.)
   - Tool version and installation method
   - Any relevant logs or output

### 2. Suggest Features

Have an idea for a new tool or feature? We'd love to hear it:

1. Check [Discussions](https://github.com/orgs/ucli-tools/discussions) first
2. Create a new discussion in the "Ideas" category
3. Describe the problem it solves for developers
4. Explain your proposed solution
5. Consider CLI usability and cross-platform compatibility

### 3. Improve Documentation

Documentation is crucial for CLI tools:

- Fix typos and errors
- Add missing command examples
- Improve clarity of usage instructions
- Add troubleshooting guides
- Write tutorials and best practices
- Update tool descriptions

### 4. Submit Code

Ready to code? Excellent!

1. **Fork the repository** of the tool you want to improve
2. **Create a branch** for your feature/fix
3. **Make your changes** following our coding standards
4. **Test thoroughly** on multiple platforms
5. **Submit a pull request**

## Pull Request Process

### Before Submitting

- [ ] Code follows existing style and patterns
- [ ] Changes work on Linux, macOS, and Windows
- [ ] Documentation is updated (README, help text)
- [ ] Commit messages are clear and descriptive
- [ ] No unrelated changes included
- [ ] Tool installs and runs correctly with `ucli build`

### Pull Request Template

```markdown
## Description
[Clear description of what this PR does]

## Tool Affected
[Which tool(s) does this affect?]

## Motivation
[Why is this change needed? What problem does it solve?]

## Changes
- [List of changes made]
- [Files modified]
- [New features added]

## Testing
[How was this tested? On which platforms?]
[Include test commands and expected output]

## Related Issues
Fixes #[issue number]
Addresses #[discussion number]
```

### Review Process

1. Maintainers will review your PR
2. Address any requested changes
3. Test on additional platforms if needed
4. Once approved, it will be merged
5. You'll be credited as a contributor!

## Development Setup

### Tool Development

Each tool follows a similar development pattern:

```bash
# Clone the tool repository
git clone https://github.com/ucli-tools/TOOL_NAME
cd TOOL_NAME

# Check the README for specific setup instructions
# Most tools use Make for development tasks

# Install development dependencies
make install-dev  # or similar

# Run tests
make test

# Check code quality
make lint

# Build for testing
make build
```

### Testing Across Platforms

Since UCLI Tools are cross-platform, test on:

- **Linux**: Primary development platform
- **macOS**: Using GitHub Actions or local testing
- **Windows**: Using WSL, Git Bash, or native terminals

### UCLI Integration

When developing tools:

```bash
# Test ucli integration
ucli build TOOL_NAME

# Verify installation works
TOOL_NAME --help

# Test basic functionality
TOOL_NAME [basic command]
```

## Coding Standards

### General Principles

- Write clear, readable code
- Add comments for complex logic
- Follow existing patterns in each tool
- Keep changes focused and minimal
- Test on all supported platforms
- Include comprehensive help text

### Bash Scripts (Most Tools)

- Use `shellcheck` for linting
- Follow Google Shell Style Guide
- Add error handling with `set -euo pipefail`
- Include comprehensive `--help` output
- Use functions for reusable code
- Add usage examples in comments

### Python Tools (mdtexpdf, mdaudiobook)

- Follow PEP 8 style guide
- Use type hints where possible
- Write comprehensive docstrings
- Add unit tests with pytest
- Handle imports properly
- Include requirements.txt or setup.py

### Go Tools (Future)

- Follow standard Go formatting (`gofmt`)
- Use `golint` and `go vet`
- Write GoDoc comments
- Include unit tests
- Follow Go project layout conventions

### Documentation

- Keep README.md updated and comprehensive
- Include installation instructions
- Provide usage examples
- Document all command-line options
- Add troubleshooting section
- Link to related tools

## Commit Messages

Write clear, descriptive commit messages:

```
feat: add parallel processing to gits clone-all
fix: resolve Windows path handling in mdtexpdf
docs: improve installation instructions for ucli
test: add cross-platform tests for audiobook generation
refactor: simplify error handling in GitS
chore: update CI workflow for better Windows support
```

**Format:**
- `feat:` - New feature or enhancement
- `fix:` - Bug fix
- `docs:` - Documentation changes
- `test:` - Test additions or fixes
- `refactor:` - Code refactoring without functionality changes
- `chore:` - Maintenance, CI, build improvements

## Tool-Specific Guidelines

### GitS (Git Workflow Tool)

- Test on Forgejo, Gitea, and GitHub
- Handle different git configurations
- Maintain backward compatibility
- Include performance optimizations

### mdtexpdf (Document Generation)

- Test LaTeX compilation on different systems
- Validate PDF output quality
- Support various Markdown extensions
- Maintain template compatibility

### mdaudiobook (Audio Generation)

- Test audio quality and formats
- Validate TTS integration
- Ensure cross-platform audio compatibility
- Optimize for large document processing

### ucli (Tool Manager)

- Test tool discovery and installation
- Validate dependency management
- Ensure cross-platform compatibility
- Maintain security in script execution

## Creating New Tools

Want to add a new tool to the ecosystem?

### Requirements

- [ ] Solves a real developer productivity problem
- [ ] Cross-platform compatible (Linux/macOS/Windows)
- [ ] Includes comprehensive tests
- [ ] Has clear documentation and examples
- [ ] Integrates with `ucli build` system
- [ ] Follows UCLI Tools coding standards

### Process

1. **Propose the idea** in [Discussions](https://github.com/orgs/ucli-tools/discussions)
2. **Create proof of concept** in your fork
3. **Get community feedback**
4. **Submit as new repository** under ucli-tools organization
5. **Update ucli** to support the new tool
6. **Add to documentation and website**

## Getting Help

Need help contributing?

- [GitHub Discussions](https://github.com/orgs/ucli-tools/discussions) - Ask questions
- [Documentation](https://docs.ucli.tools) - Learn about tools
- [Tool READMEs](https://github.com/ucli-tools) - Specific tool docs
- [Community](https://github.com/ucli-tools/community) - General discussions

## Recognition

All contributors are recognized in:

- Repository contributors list
- Tool changelogs and release notes
- Community acknowledgments
- Website contributor section

## License

By contributing, you agree that your contributions will be licensed under the Apache 2.0 License.

---

**Thank you for contributing to UCLI Tools!** 🚀

Your contributions help developers work more efficiently across all platforms.
