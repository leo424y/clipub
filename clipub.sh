# watch -n5 'bash -c "source ./clipub.sh; f"'

USER_NAME=leo424y
REPO_NAME=clipub
NOTE_PATH=~/Documents/GitHub/$REPO_NAME
NOW=$(date +"%Y%m%d-%R:%S")

f(){
  if [ "$(pbpaste)" = "$(cat .temp)" ]; then
    return
  else
    CONTENT="$(pbpaste)"
  fi

  cd $NOTE_PATH || exit
  git checkout -B $USER_NAME
  echo "$CONTENT" > ".temp"
  git commit -m "$NOW" -m "$CONTENT" --allow-empty
}
