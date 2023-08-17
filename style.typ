/* SPDX-License-Identifier: GPL-3.0-or-later
 *
 * SPDX-FileCopyrightText: 2023 Tristan Partin <tristan@partin.io>
 */

#let ACCENT = cmyk(0%, 100%, 100%, 69%)

#let SECTION_TEXT_SIZE = 14pt
#let TITLE_TEXT_SIZE = 11pt
#let SUBTITLE_TEXT_SIZE = 10.5pt
#let DEFAULT_TEXT_SIZE = 9.675pt
#let SMALL_TEXT_SIZE = 8.5pt

#let MARGIN = 1cm
#let SPACING = 7pt

#let accent(content) = text(fill: ACCENT)[*#content*]
