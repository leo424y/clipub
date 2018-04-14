# TODO in bash
# watch -n5 'zsh -c "source /Users/y/Documents/Github/clipub/clipub.sh; f"'

USER_NAME=leo424y # use leo424y it if you want to join clipub project
REPO_NAME=clipub
NOTE_PATH=~/Documents/GitHub/$REPO_NAME
NOW=$(date +"%Y%m%d-%R:%S")

f(){
  if [ "$(pbpaste)" = "$(cat temp)" ]; then
    return
  else
    CONTENT="$(pbpaste)"
  fi

  cd $NOTE_PATH || exit
  git checkout -B $USER_NAME
  echo "$CONTENT" > "temp"
  git commit -m "$NOW" -m "$CONTENT" --allow-empty
}
