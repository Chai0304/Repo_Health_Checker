echo "Running repo health checks..."


echo "Checking README.md..."
if [ ! -f "README.md" ]; then
  echo "FAIL: README.md does not exist"
  exit 1
fi

line_count=$(wc -l < README.md)
if [ "$line_count" -le 5 ]; then
  echo "FAIL: README.md has $line_count lines, needs more than 5"
  exit 1
fi
echo "PASS: README.md has $line_count lines"


echo "Checking .gitignore..."
if [ ! -f ".gitignore" ]; then
  echo "FAIL: .gitignore does not exist"
  exit 1
fi
echo "PASS: .gitignore exists"


echo "Checking for secret files..."
if git ls-files | grep -q "\.env$"; then
  echo "FAIL: .env file is committed to the repo"
  exit 1
fi
echo "PASS: No secret files committed"


echo "Checking last commit message..."
word_count=$(git log -1 --pretty=%B | wc -w)
if [ "$word_count" -le 5 ]; then
  echo "FAIL: Last commit message has $word_count words, needs more than 5"
  exit 1
fi
echo "PASS: Last commit message has $word_count words"

echo "All checks passed!"
exit 0