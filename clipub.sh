
# TODO in bash
# watch -n5 'zsh -c "source /Users/y/Documents/Github/clipub/clipub.sh; f"'

USER_NAME=leo424y # use leo424y it if you want to join clipub project
REPO_NAME=clipub
NOTE_PATH=~/Documents/GitHub/$REPO_NAME

f(){
  USER_OS=$0
  DATE=$(date +"%Y%m%d")
  NOW=$(date +"%Y%m%d-%R:%S")
  GITHUB_LINK="https://github.com/$USER_NAME/$REPO_NAME/blob/$DATE/$DATE/$NOW"

  #TODO cross platform clipboard, USER_OS
  if [ "$(pbpaste)" != "" ]; then
    return
  else
    CONTENT="$(pbpaste)"
  fi

  # TODO commit without files
  cd $NOTE_PATH || exit
  git checkout -B $DATE
  # mkdir -p "./$DATE"
  # echo "$CONTENT" > "$NOTE_PATH/$DATE/$NOW"
  # git add .
  # TODO git inline
  git commit -m "$CONTENT" -m "$GITHUB_LINK"
  git push --all

  #TODO to find clipboarc change
  pbcopy </dev/null
}
