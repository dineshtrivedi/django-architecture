#!/bin/bash
RESTORE='\033[0m'
RED='\033[00;31m'
GREEN='\033[00;32m'
YELLOW='\033[00;33m'

export VENV_BASE=.django_architecture
export PROJ_BASE="$(dirname "${BASH_SOURCE[0]}")"
CD=$(pwd)
cd "$PROJ_BASE"
export PROJ_BASE=$(pwd)
cd $CD

. ci/git_aliases.sh

alias manage='python "$PROJ_BASE"/board_manager/manage.py'

devhelp() {
    echo -e "${GREEN}devhelp${RESTORE}              Prints this ${RED}help${RESTORE}"
    echo -e ""
    echo -e "${GREEN}rebuild_virtualenv${RESTORE}           Rebuild virtualenv for this project"
    echo -e ""
}

_create_git_aliases() {
    git config alias.co checkout
    git config alias.st status
    git config alias.ci commit
    git config alias.br branch
    git config alias.hist "log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short"
}

echo_red() {
    echo -e "${RED}$1${RESTORE}";
}

echo_green() {
    echo -e "${GREEN}$1${RESTORE}";
}

echo_yellow() {
    echo -e "${YELLOW}$1${RESTORE}";
}

rebuild_virtualenv() {
    CD=$(pwd)
    cd "$PROJ_BASE"

    deactivate
    rm -rf "$VENV_BASE"

    pyenv install `cat .python-version` --skip-existing

    python -m venv "$VENV_BASE"
    source  "$PROJ_BASE/$VENV_BASE/bin/activate"

    pip install --upgrade pip==21.1.2 setuptools==57.0.0
    pip install -r requirements.txt

    cd $CD
}

_create_git_aliases


PYTHON_VERSION=`cat ./.python-version`
echo_green "Installing python version: ${PYTHON_VERSION}\n"

pyenv install `cat .python-version` --skip-existing | exit 0

echo_green "Welcome to django_architecture's dev env"
echo_green "Hint: autocomplete works for the commands below ;)"
echo_red   "------------------------------------------------------------------------"
devhelp


if test -f "$PROJ_BASE/$VENV_BASE/bin/activate"; then
    source "$PROJ_BASE/$VENV_BASE/bin/activate"
else
    echo_red "No virtualenv found!"
    echo_green "Run: rebuild_virtualenv"
fi

