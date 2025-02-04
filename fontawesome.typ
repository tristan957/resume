/* SPDX-License-Identifier: GPL-3.0-or-later
 *
 * SPDX-FileCopyrightText: Tristan Partin <tristan@partin.io>
 */

#let icons = (
  at: (
    path: "fonts/fontawesome/svgs/solid/at.svg",
  ),
  calendar: (
    path: "fonts/fontawesome/svgs/regular/calendar.svg",
  ),
  file: (
    path: "fonts/fontawesome/svgs/solid/file.svg",
  ),
  github: (
    path: "fonts/fontawesome/svgs/brands/github.svg",
  ),
  graduation-cap: (
    path: "fonts/fontawesome/svgs/solid/graduation-cap.svg",
  ),
  hashtag: (
    path: "fonts/fontawesome/svgs/solid/hashtag.svg",
  ),
  linkedin-in: (
    path: "fonts/fontawesome/svgs/brands/linkedin-in.svg",
  ),
  location-dot: (
    path: "fonts/fontawesome/svgs/solid/location-dot.svg",
  ),
  phone: (
    path: "fonts/fontawesome/svgs/solid/phone.svg",
  ),
  rss: (
    path: "fonts/fontawesome/svgs/solid/rss.svg",
  ),
  trophy: (
    path: "fonts/fontawesome/svgs/solid/trophy.svg",
  ),
)

#let icon(height: .75em, name) = {
  let i = icons.at(name)

  box(
    height: height,
    baseline: i.at("baseline", default: 0em),
    image(i.path),
  )
}

#let attach(height: 0.75em, padding: 0.15em, name, content) = [
  #icon(name, height: height)
  #h(padding)
  #content
]
