/* SPDX-License-Identifier: GPL-3.0-or-later
 *
 * SPDX-FileCopyrightText: 2023 Tristan Partin <tristan@partin.io>
 */

#import "../icon.typ"
#import "../style.typ"
#import "common.typ": section, separator, subtitle, title

#let data = yaml("../data/projects.yml")

#let project(p) = {
  let content = ()

  content.push(title(p.name))

  if p.at("url", default: none) != none {
    content.push(icon.attach(p.icon)[
      #style.accent(link(p.url, p.url.trim(regex("(https|http)://"))))
    ])
  }

  content.push(list(tight: true, ..p.descriptors))

  stack(
    spacing: style.SPACING,
    ..content,
  )
}

#let content = [
  #section("Projects")

  #for p in data [
    #project(p)

    #if p != data.last() [
      #separator
    ]
  ]
]
