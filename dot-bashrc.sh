## updates apt installs
upd() {
    sudo apt update;
    sudo apt upgrade -y;
    sudo apt autoremove -y;
}

## rebrews alternative homebrew installs
rebrew() {
    eval "$(homebrew/bin/brew shellenv)"
    brew update --force --quiet
    chmod -R go-w "$(brew --prefix)/share/zsh"
}

kbdate() {

  dt=$(date +"%Y-%m-%d %H:%M");

  if [[ $1 && $2 ]]
    then
    dt=$(date --date="$1 $2" +"%Y-%m-%d %H:%M");
  elif [[ $1 ]]
  then
    dt=$(date --date="$1" +"%Y-%m-%d 00:00");
  fi

  d1=$(date --date="$1" +"%Y-%m-01 00:00");
  yy=$(date --date="$dt" +"%y");
  mm=$(date --date="$dt" +"%m");
  dd=$(date --date="$dt" +"%d");

  t2=$(date --date="$dt" +"%s");
  t1=$(date --date="$d1" +"%s");

  h=$(((t2-t1)/3600));
  hhh=$(printf %03d $h);

  echo "KB$yy$mm$hhh";
}

