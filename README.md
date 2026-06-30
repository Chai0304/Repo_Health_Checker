# Repo Health Checker

This repository contains a shell script (`check.sh`) that automatically validates the health of this repo on every push, using GitHub Actions.

## What it checks

1. **README.md exists and has more than 5 lines** — ensures documentation isn't empty or missing.
2. **.gitignore exists** — ensures unwanted files (secrets, build artifacts) won't get committed.
3. **No .env or secret files are committed** — prevents leaking credentials into version control.
4. **Commit messages have more than 5 words** — encourages meaningful, descriptive commit history.

## Why

These checks simulate a basic CI gate, similar to what real engineering teams use to keep their repositories clean and safe before merging code.

## How it runs

The script `check.sh` runs automatically via a GitHub Actions workflow (`.github/workflows/check.yml`) on every push to this repository. If any check fails, the script exits with code 1 and the CI badge turns red. If all checks pass, it exits with code 0 and the badge turns green.