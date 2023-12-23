find . -name .git -type d -exec git --git-dir '{}' pull --all ';'
