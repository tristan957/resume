/* SPDX-License-Identifier: GPL-3.0-or-later
 *
 * SPDX-FileCopyrightText: 2023 Tristan Partin <tristan@partin.io>
 */

#import "../fontawesome.typ" as fa
#import "../style.typ"
#import "common.typ": section, separator, subtitle, title

#let data = yaml("../data/experience.yml")

#let experience(e) = [
  #let timeline(t) = fa.attach(
    "calendar"
  )[
    #if t.end != none [
      #t.start.month #t.start.year -- #t.end.month #t.end.year
    ] else [
      #t.start.month #t.start.year -- Present
    ]
  ]

  #let location(l, style: none) = fa.attach("location-dot")[
    #l.city, #l.state
    #if style != none [
      (#style)
    ]
  ]

  #stack(
    title(e.title),
    subtitle(link(e.company.url, e.company.name)),
    text(size: style.SMALL_TEXT_SIZE)[
      #stack(
        dir: ltr,
        spacing: 1fr,
        timeline(e.timeline),
        location(e.location, style: e.at("style", default: none)),
      )
    ],
    list(tight: true, ..e.descriptors),
    spacing: style.SPACING,
  )
]

#let recent = data.find(e => e.timeline.end == none)

#let content = [
  #section("Experience")

  /* Could it be possible to not layout content if we know it'll be on the
   * next page?
   */
  #let data = data.filter(e => not e.at("hidden", default: false))

  #for e in data [
    #if e == data.first() [
      #experience(e) <recent-experience>
    ] else [
      #experience(e)
    ]

    #if e != data.last() [
      #separator
    ]
  ]
]
