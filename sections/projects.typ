/* SPDX-License-Identifier: GPL-3.0-or-later
 *
 * SPDX-FileCopyrightText: 2023 Tristan Partin <tristan@partin.io>
 */

#import "../fontawesome.typ": fa-attach
#import "../style.typ"
#import "common.typ": section, separator, subtitle, title

#let data = yaml("../data/projects.yml")
#let host-to-icon = (
  "github.com": "github",
)

#let parse-url(url) = {
  let url = url.trim(regex("(https|http)://"))
  let components = url.split("/")

  return (components.at(0), components.slice(1).join("/"))
}

#let project(project) = {
  let content = ()

  content.push(title(project.name))

  if project.at("url", default: none) != none {
    let (host, slug) = parse-url(project.url)

    content.push(fa-attach(host-to-icon.at(host))[
      #style.accent(link(project.url, slug))
    ])
  }

  content.push(list(tight: true, ..project.descriptors))

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
