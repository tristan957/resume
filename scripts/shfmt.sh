#!/bin/sh

# SPDX-License-Identifier: CC0-1.0
#
# SPDX-FileCopyrightText: Tristan Partin <tristan@partin.io>

shfmt --diff --language-dialect sh scripts/*.sh
