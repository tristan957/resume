/* SPDX-License-Identifier: GPL-3.0-or-later
 *
 * SPDX-FileCopyrightText: 2023 Tristan Partin <tristan@partin.io>
 */

#import "common.typ": section

#let data = yaml("../data/skills.yml")

#let skill(skill) = box(
  stroke: (
    paint: cmyk(0%, 0%, 0%, 16%),
    thickness: 0.75pt,
  ),
  inset: 4pt,
  radius: 3pt,
  skill.name,
)

#let content = [
  #section("Skills")

  #for s in data [
    #skill(s)
  ]
]
