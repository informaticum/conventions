#!/usr/bin/env bash

function intro {
    read cmd msg <<< ${1}
    echo "[$(tput bold)$(tput setaf 5)${cmd}$(tput sgr0) $(tput setaf 5)${msg}$(tput sgr0)]"
}

intro "INSTALL project locally"
mvn clean install
