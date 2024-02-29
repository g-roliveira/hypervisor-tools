Get-ChildItem -Recurse -Depth 2 -Force |
Where-Object { $_.Mode -match "h" -and $_.FullName -like "*\.git" } |
ForEach-Object {
  cd $_.FullName
  cd ../
  git pull
  git remote set-head origin -a
  git switch $(git rev-parse --abbrev-ref HEAD)
  git remote prune origin
  cd ../
}
