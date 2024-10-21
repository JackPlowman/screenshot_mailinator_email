# ------------------------------------------------------------------------------
# Common Commands
# ------------------------------------------------------------------------------

# Install python dependencies
install:
    poetry install

# ------------------------------------------------------------------------------
# Cleaning Commands
# ------------------------------------------------------------------------------

# Remove all generated files
clean:
    find . \( \
      -name '__pycache__' -o \
      -name '.coverage' -o \
      -name '.mypy_cache' -o \
      -name '.pytest_cache' -o \
      -name '.ruff_cache' -o \
      -name '*.pyc' -o \
      -name '*.pyd' -o \
      -name '*.pyo' -o \
      -name 'coverage.xml' -o \
      -name 'db.sqlite3' \
    \) -print | xargs rm -rfv

# ------------------------------------------------------------------------------
# Ruff - Python Linting and Formating
# Set up ruff red-knot when it's ready
# ------------------------------------------------------------------------------

# Fix all Ruff issues
ruff-fix:
    just ruff-lint-fix
    just ruff-format-fix

# Check for Ruff issues
ruff-lint:
    poetry run ruff check screenshot_mailinator_email

# Fix Ruff lint issues
ruff-lint-fix:
    poetry run ruff check screenshot_mailinator_email --fix

# Check for Ruff format issues
ruff-format:
    poetry run ruff format --check screenshot_mailinator_email

# Fix Ruff format issues
ruff-format-fix:
    poetry run ruff format screenshot_mailinator_email

# ------------------------------------------------------------------------------
# Other Python Tools
# ------------------------------------------------------------------------------

# Check for unused code
vulture:
    poetry run vulture screenshot_mailinator_email

# ------------------------------------------------------------------------------
# Prettier - File Formatting
# ------------------------------------------------------------------------------

# Check for prettier issues
prettier-check:
    prettier . --check

# Fix prettier issues
prettier-format:
    prettier . --check --write

# ------------------------------------------------------------------------------
# Justfile
# ------------------------------------------------------------------------------

# Format the Just code
format:
    just --fmt --unstable

# Check for Just format issues
format-check:
    just --fmt --check --unstable

# ------------------------------------------------------------------------------
# Git Hooks
# ------------------------------------------------------------------------------

# Install pre commit hook to run on all commits
install-git-hooks:
    cp -f githooks/pre-commit .git/hooks/pre-commit
    cp -f githooks/post-commit .git/hooks/post-commit
    chmod ug+x .git/hooks/*
