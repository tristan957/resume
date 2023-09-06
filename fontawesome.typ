/* SPDX-License-Identifier: GPL-3.0-or-later
 *
 * SPDX-FileCopyrightText: 2023 Tristan Partin <tristan@partin.io>
 */

#let paths = (
  at: "fonts/fontawesome/svgs/solid/at.svg",
  calendar: "fonts/fontawesome/svgs/regular/calendar.svg",
  github: "fonts/fontawesome/svgs/brands/github.svg",
  graduation-cap: "fonts/fontawesome/svgs/solid/graduation-cap.svg",
  linkedin-in: "fonts/fontawesome/svgs/brands/linkedin-in.svg",
  location-dot: "fonts/fontawesome/svgs/solid/location-dot.svg",
  phone: "fonts/fontawesome/svgs/solid/phone.svg",
  rss: "fonts/fontawesome/svgs/solid/rss.svg",
  trophy: "fonts/fontawesome/svgs/solid/trophy.svg",
)

#let icon(height: .75em, baseline: 0em, name) = box(
  height: height,
  baseline: baseline,
  image(paths.at(name)),
)

#let attach(height: 0.75em, baseline: 0em, padding: 0.15em, name, content) = [
  #icon(name, height: height, baseline: baseline)
  #h(padding)
  #content
]
