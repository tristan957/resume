/* SPDX-License-Identifier: GPL-3.0-or-later
 *
 * SPDX-FileCopyrightText: 2023 Tristan Partin <tristan@partin.io>
 */

#import "../fontawesome.typ": fa-attach
#import "../style.typ"
#import "common.typ": section, subtitle, title

#let data = yaml("../data/education.yml")

#let education(education) = stack(
  spacing: style.SPACING,
  title([
    #education.degree.level \
    #education.degree.focus
  ]),
  subtitle(link(education.school.url, education.school.name)),
  text(size: style.SMALL_TEXT_SIZE)[
    #stack(
      dir: ltr,
      spacing: 1fr,
      fa-attach("graduation-cap")[
        #education.graduation-date.month #education.graduation-date.year
      ],
      fa-attach("location-dot")[
        #education.school.location.city, #education.school.location.state
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
