# ------------------------------------------------------------------------------
# Common Commands
# ------------------------------------------------------------------------------

# Install python dependencies
install:
    uv sync

# Install python dependencies for development
install-all:
    uv sync --all-extras

# Run screenshot_mailinator_email.py script
@run mailinator_url:
    uv run python screenshot_mailinator_email.py {{ mailinator_url }}

unit-test:
    uv run pytest . --cov=. --cov-report=xml

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
      -name '.coverage' -o \
      -name '*.pyc' -o \
      -name '*.pyd' -o \
      -name '*.pyo' -o \
      -name 'coverage.xml' -o \
      -name 'db.sqlite3' \
      -name '*.png' \
    \) -print | xargs rm -rfv

# ------------------------------------------------------------------------------
# Ruff - Python Linting and Formatting
# ------------------------------------------------------------------------------

# Fix all Ruff issues
ruff-fix:
    just ruff-format-fix
    just ruff-lint-fix

# Check for all Ruff issues
ruff-checks:
    just ruff-format-check
    just ruff-lint-check

# Check for Ruff issues
ruff-lint-check:
    uv run ruff check .

# Fix Ruff lint issues
ruff-lint-fix:
    uv run ruff check . --fix

# Check for Ruff format issues
ruff-format-check:
    uv run ruff format --check .

# Fix Ruff format issues
ruff-format-fix:
    uv run ruff format .

# ------------------------------------------------------------------------------
# Ty - Python Type Checking
# ------------------------------------------------------------------------------

# Check for type issues with Ty
ty-check:
    uv run ty check .

# ------------------------------------------------------------------------------
# Other Python Tools
# ------------------------------------------------------------------------------

# Check for unused code
vulture:
    uv run vulture screenshot_mailinator_email.py

uv-lock-check:
    uv lock --check

# ------------------------------------------------------------------------------
# Prettier
# ------------------------------------------------------------------------------

# Check all files with prettier
prettier-check:
    prettier . --check

# Format all files with prettier
prettier-format:
    prettier . --check --write

# ------------------------------------------------------------------------------
# Justfile
# ------------------------------------------------------------------------------

# Format Justfile
format:
    just --fmt --unstable

# Check Justfile formatting
format-check:
    just --fmt --check --unstable

# ------------------------------------------------------------------------------
# Gitleaks
# ------------------------------------------------------------------------------

# Run gitleaks detection
gitleaks-detect:
    gitleaks detect --source .

# ------------------------------------------------------------------------------
# Lefthook
# ------------------------------------------------------------------------------

# Validate lefthook config
lefthook-validate:
    lefthook validate

# ------------------------------------------------------------------------------
# Zizmor
# ------------------------------------------------------------------------------

# Run zizmor checking
zizmor-check:
    uvx zizmor . --persona=auditor

# ------------------------------------------------------------------------------
# Pinact
# ------------------------------------------------------------------------------

# Run pinact
pinact-run:
    pinact run

# Run pinact checking
pinact-check:
    pinact run --verify --check

# Run pinact update
pinact-update:
    pinact run --update

# ------------------------------------------------------------------------------
# Git Hooks
# ------------------------------------------------------------------------------

# Install pre commit hook to run on all commits
install-git-hooks:
    lefthook install -f
