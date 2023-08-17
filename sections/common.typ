/* SPDX-License-Identifier: GPL-3.0-or-later
 *
 * SPDX-FileCopyrightText: 2023 Tristan Partin <tristan@partin.io>
 */

#import "../style.typ"

#let section(header) = [
  #style.accent[
    #heading(level: 2)[
      #text(size: style.SECTION_TEXT_SIZE)[
        #upper(header)
      ]
    ]
  ]

  #line(length: 100%, stroke: (paint: style.ACCENT, thickness: 1.5pt))
]

#let title(title) = heading(level: 3)[
  #text(size: style.TITLE_TEXT_SIZE)[#title]
]

#let subtitle(subtitle) = text(size: style.SUBTITLE_TEXT_SIZE)[
  #style.accent(subtitle)
]

#let separator = line(
  length: 100%,
  stroke: (
    paint: cmyk(0%, 0%, 0%, 21%),
    thickness: 1pt,
    dash: "densely-dashed",
  ),
)
