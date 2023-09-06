/* SPDX-License-Identifier: GPL-3.0-or-later
 *
 * SPDX-FileCopyrightText: 2023 Tristan Partin <tristan@partin.io>
 */

#import "../fontawesome.typ" as fa
#import "../style.typ"

#let data = yaml("../data/attributes.yml")

#let attribute(attribute) = fa.attach(attribute.fa-name)[
  #if attribute.at("uri", default: none) != none [
    #link(attribute.uri, text(size: style.SMALL_TEXT_SIZE, attribute.content))
  ] else [
    #text(size: style.SMALL_TEXT_SIZE, attribute.content)
  ]
]

#let content = stack(
  dir: ltr,
  spacing: 1em,
  ..data.map(a => attribute(a)),
)
