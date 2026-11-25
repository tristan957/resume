/* SPDX-License-Identifier: GPL-3.0-or-later
 *
 * SPDX-FileCopyrightText: Tristan Partin <tristan@partin.io>
 */

#import "@preview/fontawesome:0.6.2": fa-icon

#let regular = ("calendar",)

#let icon(height: .75em, name) = fa-icon(
  name,
  solid: name not in regular,
  size: height,
)

#let attach(height: 0.75em, padding: 0.15em, name, content) = [
  #icon(name, height: height)
  #h(padding)
  #content
]
