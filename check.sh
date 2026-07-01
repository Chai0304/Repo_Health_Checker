#!/bin/bash

echo "======================================"
echo "Running Repository Health Checks"
echo "======================================"

# -----------------------------
# Check README.md
# -----------------------------
echo ""
echo "Checking README.md..."

if [ ! -f "README.md" ]; then
    echo "FAIL: README.md does not exist."
    exit 1
fi

line_count=$(wc -l < README.md)

if [ "$line_count" -le 5 ]; then
    echo "FAIL: README.md has only $line_count lines. It must contain more than 5 lines."
    exit 1
fi

echo "PASS: README.md has $line_count lines."

# -----------------------------
# Check .gitignore
# -----------------------------
echo ""
echo "Checking .gitignore..."

if [ ! -f ".gitignore" ]; then
    echo "FAIL: .gitignore does not exist."
    exit 1
fi

echo "PASS: .gitignore exists."

# -----------------------------
# Check for committed .env file
# -----------------------------
echo ""
echo "Checking for secret files..."

if git ls-files | grep -qE "^\.env$|/\.env$"; then
    echo "FAIL: .env file is committed to the repository."
    exit 1
fi

echo "PASS: No .env file committed."

# -----------------------------
# Check last commit message
# -----------------------------
echo ""
echo "Checking last commit message..."

commit_message=$(git log -1 --pretty=%B)

echo "Latest Commit Message:"
echo "--------------------------------------"
echo "$commit_message"
echo "--------------------------------------"

word_count=$(echo "$commit_message" | wc -w)

echo "Word Count: $word_count"

if [ "$word_count" -le 5 ]; then
    echo "FAIL: Commit message must contain more than 5 words."
    exit 1
fi

echo "PASS: Last commit message has $word_count words."

echo ""
echo "======================================"
echo "All repository health checks passed!"
echo "======================================"

exit 0
