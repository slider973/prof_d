#!/usr/bin/env bash

NAME_DIRECTORY=$1
DESTINATION_DIRECTORY=$2

DIRNAME_SCRIPT="$(dirname ${0})"
PROGRAME="$(basename ${0})"

_error ()
{
  echo "[ERROR] ${PROGRAME}:" && printf '%b' "$1"
}

_info ()
{
  echo "[INFO] ${PROGRAME}:" && printf '%b' "$1"
}

get_dirname()
{
  echo "${PROGRAME}"
  echo "${NAME_DIRECTORY}"
}

create_directory() {
  mkdir -p
}

