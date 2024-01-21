/* SPDX-License-Identifier: GPL-3.0-or-later
 *
 * SPDX-FileCopyrightText: 2023 Tristan Partin <tristan@partin.io>
 */

#import "../fontawesome.typ" as fa
#import "../style.typ"

#let data = yaml("../data/attributes.yml")

#let attribute(a) = fa.attach(a.fa-name)[
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
