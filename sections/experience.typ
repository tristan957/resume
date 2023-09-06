/* SPDX-License-Identifier: GPL-3.0-or-later
 *
 * SPDX-FileCopyrightText: 2023 Tristan Partin <tristan@partin.io>
 */

#import "../fontawesome.typ" as fa

#import "../style.typ"
#import "common.typ": section, separator, subtitle, title

#let data = yaml("../data/experience.yml")

#let experience(e) = [
  #let timeline(timeline) = fa.attach(
    "calendar"
  )[
    #if timeline.end != none [
      #timeline.start.month #timeline.start.year -- #timeline.end.month #timeline.end.year
    ] else [
      #timeline.start.month #timeline.start.year -- Present
    ]
  ]

  #let location(location, style: none) = fa.attach("location-dot")[
    #location.city, #location.state
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
