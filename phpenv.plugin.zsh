# SPDX-License-Identifier: MIT
phpenvdirs=("$HOME/.phpenv" "$XDG_DATA_HOME/phpenv" "/usr/local/bin/phpenv" "/usr/local/phpenv" "/opt/phpenv")

FOUND_PHPENV=0
for phpenvdir in $phpenvdirs; do
    if [[ -d "${phpenvdir}/bin" ]]; then
        FOUND_PHPENV=1
        break
    fi
done

if [[ $FOUND_PHPENV -eq 0 ]]; then
    if (( $+commands[brew] )) && phpenvdir="$(brew --prefix phpenv)"; then
        [[ -d "${phpenvdir}/bin" ]] && FOUND_PHPENV=1
    fi
fi

if [[ $FOUND_PHPENV -eq 1 ]]; then
    (( $+commands[phpenv] )) || export PATH="${phpenvdir}/bin:$PATH"
    eval "$(phpenv init -)"

    function phpenv_prompt_info() {
      local version="$(phpenv version-name 2>/dev/null)"
      echo "${version:gs/%/%%}"
    }

    if [[ -d "${phpenvdir}/versions" ]]; then
        export PHPENV_ROOT=$phpenvdir
    fi
else
    function phpenv_prompt_info() {
      local version="$(php --version | cut -d' ' -f2 | sed '1p;d')"
      echo "system: ${version:gs/%/%%}"
    }
fi

unset phpenvdir phpenvdirs FOUND_PHPENV
