
# TODO in bash
# watch -n5 'zsh -c "source /Users/y/Documents/Github/clipub/clipub.sh; f"'

REPO_NAME=clipub
NOTE_PATH=~/Documents/GitHub/$REPO_NAME

f(){
  DATE=$(date +"%Y%m%d")
  NOW=$(date +"%Y%m%d-%R:%S")

  #TODO cross platform clipboard, USER_OS
  if [ "$(pbpaste)" = "$(cat temp)" ]; then
    return
  else
    CONTENT="$(pbpaste)"
  fi

  cd $NOTE_PATH || exit
  git checkout -B $DATE
  echo "$CONTENT" > "temp"
  git commit -m "$NOW" -m "$CONTENT" --allow-empty
}
