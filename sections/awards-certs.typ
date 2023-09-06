/* SPDX-License-Identifier: GPL-3.0-or-later
 *
 * SPDX-FileCopyrightText: 2023 Tristan Partin <tristan@partin.io>
 */

#import "common.typ": section, separator, title
#import "../fontawesome.typ" as fa
#import "../style.typ"

#let data = yaml("../data/awards-certs.yml")

#let award-cert(ac) = stack(
  spacing: style.SPACING,
  title(ac.name),
  stack(
    dir: ltr,
    spacing: 1fr,
    fa.attach("trophy")[
      #style.accent(link(ac.organization.url, ac.organization.name))
    ],
    fa.attach("calendar")[#ac.year]
  ),
)

#let content = [
  #section("Awards/Certs")

  #for ac in data [
    #award-cert(ac)
    #if ac != data.last() [
      #separator
    ]
  ]
]
