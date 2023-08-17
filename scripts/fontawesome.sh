#!/bin/sh

# SPDX-License-Identifier: CC0-1.0
#
# SPDX-FileCopyrightText: 2023 Tristan Partin <tristan@partin.io>

FONTAWESOME_VERSION="6.4.2"

if [ ! -d fonts/fontawesome ]; then
	mkdir -p fonts
	curl -sL https://use.fontawesome.com/releases/v${FONTAWESOME_VERSION}/fontawesome-free-${FONTAWESOME_VERSION}-desktop.zip \
		-o fonts/fontawesome.zip
	unzip -q -d fonts fonts/fontawesome.zip
	mv fonts/fontawesome-free-${FONTAWESOME_VERSION}-desktop fonts/fontawesome
	rm -f fonts/fontawesome.zip
fi
