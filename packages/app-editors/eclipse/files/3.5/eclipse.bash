#!/usr/bin/env bash
#
# Copyright 2010 Cecil Curry <leycec@gmail.com>
# Distributed under the terms of the GNU General Public License v2
#
# --------------------( SYNOPSIS                           )--------------------
# This script launches Eclipse! The Eclipse exheres fabricated this script for
# your convenience. Therefore, avoid modifying the contents of this script
# directly; rather, queue patches against the original Eclipse exheres.
#
# --------------------( CONFIGURATION                      )--------------------
# This script pulls its configuration from:
#
#      __ECLIPSE_CONFIG_FILE__
#      __ECLIPSE_ENVIRO_FILE__
#
# If Eclipse performs poorly or otherwise complains, consider modifying the
# minimum and maximum memory the configuration file allocates.
#
# --------------------( SEE ALSO                           )--------------------
# http://wiki.eclipse.org/FAQ_How_do_I_run_Eclipse%3F#eclipse.ini

# ....................{ ENVIRONMENT VARIABLES              }....................
[[ -f "__ECLIPSE_CONFIG_FILE__" ]] ||
    echo "\"__ECLIPSE_CONFIG_FILE__\" not found; assuming default configuration." 1>&2 

if [[ -z "${ECLIPSE_HOME}" ]]; then
	echo "\$ECLIPSE_HOME not set. Did you delete \"__ECLIPSE_ENVIRO_FILE__\"?" 1>&2
	exit 1
fi

local eclipse_bin="${ECLIPSE_HOME}/eclipse"

if [[ ! -x "${eclipse_bin}" ]]; then
	echo "\"${eclipse_bin}\" not found or not executable by this user." 1>&2
	exit 1
fi

# ....................{ ECLIPSE!                           }....................
echo "eclipse: running \"${ECLIPSE_BIN}\"..."
exec "${ECLIPSE_BIN}" "${@}"

