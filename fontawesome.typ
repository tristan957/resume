/* SPDX-License-Identifier: GPL-3.0-or-later
 *
 * SPDX-FileCopyrightText: 2023 Tristan Partin <tristan@partin.io>
 */

#let icons = (
  at: (
    location: "fonts/fontawesome/svgs/solid/at.svg",
  ),
  calendar: (
    location: "fonts/fontawesome/svgs/regular/calendar.svg",
  ),
  github: (
    location: "fonts/fontawesome/svgs/brands/github.svg",
  ),
  graduation-cap: (
    location: "fonts/fontawesome/svgs/solid/graduation-cap.svg",
  ),
  linkedin-in: (
    location: "fonts/fontawesome/svgs/brands/linkedin-in.svg",
    baseline: 0.115em,
  ),
  location-dot: (
    location: "fonts/fontawesome/svgs/solid/location-dot.svg",
  ),
  phone: (
    location: "fonts/fontawesome/svgs/solid/phone.svg",
  ),
  rss: (
    location: "fonts/fontawesome/svgs/solid/rss.svg",
  ),
  trophy: (
    location: "fonts/fontawesome/svgs/solid/trophy.svg",
  ),
)

#let icon(height: .75em, name) = {
  let i = icons.at(name)

  box(
    height: height,
    baseline: i.at("baseline", default: 0em),
    image(i.location),
  )
}

#let attach(height: 0.75em, padding: 0.15em, name, content) = [
  #icon(name, height: height)
  #h(padding)
  #content
]
