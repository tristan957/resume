/* SPDX-License-Identifier: GPL-3.0-or-later
 *
 * SPDX-FileCopyrightText: 2023 Tristan Partin <tristan@partin.io>
 */

#import "../fontawesome.typ" as fa
#import "../style.typ"
#import "common.typ": section, subtitle, title

#let data = yaml("../data/education.yml")

#let education(e) = stack(
  spacing: style.SPACING,
  title([
    #e.degree.level \
    #e.degree.focus
  ]),
  subtitle(link(e.school.url, e.school.name)),
  text(size: style.SMALL_TEXT_SIZE)[
    #stack(
      dir: ltr,
      spacing: 1fr,
      fa.attach("graduation-cap")[
        #e.graduation-date.month #e.graduation-date.year
      ],
      fa.attach("location-dot")[
        #e.school.location.city, #e.school.location.state
      ],
    )
  ],
)

#let content = [
  #section("Education")

  #for e in data [
    #education(e)

    #if e != data.last() [
      #separator
    ]
  ]
]
