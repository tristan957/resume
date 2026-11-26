/* SPDX-License-Identifier: GPL-3.0-or-later
 *
 * SPDX-FileCopyrightText: Tristan Partin <tristan@partin.io>
 */

#import "../icon.typ"
#import "../style.typ"

#let data = yaml("../data/attributes.yml")

#let attribute(a) = icon.attach(a.fa-name)[
  #if a.at("uri", default: none) != none [
    #link(a.uri, text(size: style.SMALL_TEXT_SIZE, a.content))
  ] else [
    #text(size: style.SMALL_TEXT_SIZE, a.content)
  ]
]

#let content = stack(
  dir: ltr,
  spacing: 1em,
  ..data.map(a => attribute(a)),
)
