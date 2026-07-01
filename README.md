![Repo Health Check](https://github.com/Chai0304/Repo_Health_Checker/actions/workflows/check.yml/badge.svg)
# Repo Health Checker

This repository contains a shell script that automatically validates the health of this repo on every push using GitHub Actions.

## What it checks

1. **README.md exists and has more than 5 lines** 
2. **.gitignore exists**
3. **No .env or secret files are committed** 
4. **Commit messages have more than 5 words** 

## Why

These checks simulate a basic CI gate, similar to what real engineering teams use to keep their repositories clean and safe before merging code.

## How it runs

The script `check.sh` runs automatically via a GitHub Actions workflow (`.github/workflows/check.yml`) on every push to this repository. If any check fails, the script exits with code 1 and the CI badge turns red. If all checks pass, it exits with code 0 and the badge turns green.

## Author

Maintained by Chai0304.