/* SPDX-License-Identifier: GPL-3.0-or-later
 *
 * SPDX-FileCopyrightText: Partin <tristan@partin.io>
 */

#import "common.typ": section, separator, title
#import "../fontawesome.typ" as fa
#import "../style.typ"

#let data = yaml("../data/awards.yml")

#let award-cert(a) = {
  if a.type == "patent" {
    stack(
      spacing: style.SPACING,
      title(a.name),
      stack(
        dir: ltr,
        spacing: 1fr,
        fa.attach("file")[
          #style.accent(link(a.organization.url, a.organization.name))
        ],
        fa.attach("hashtag")[#link(a.patent.url, a.patent.number)],
      ),
    )
  } else {
    stack(
      spacing: style.SPACING,
      title(a.name),
      stack(
        dir: ltr,
        spacing: 1fr,
        fa.attach("trophy")[
          #style.accent(link(a.organization.url, a.organization.name))
        ],
        fa.attach("calendar")[#a.year],
      ),
    )
  }
}

#let content = [
  #section("Awards")

  #let data = data.filter(a => not a.at("hidden", default: false))

  #for a in data [
    #award-cert(a)
    #if a != data.last() [
      #separator
    ]
  ]
]
