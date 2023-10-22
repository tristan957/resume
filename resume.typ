/* SPDX-License-Identifier: GPL-3.0-or-later
 *
 * SPDX-FileCopyrightText: 2023 Tristan Partin <tristan@partin.io>
 */

#import "sections/attributes.typ"
#import "sections/awards-certs.typ"
#import "sections/education.typ"
#import "sections/experience.typ"
#import "sections/projects.typ"
#import "sections/skills.typ"
#import "style.typ"

#set document(
  title: "Tristan Partin's Resume",
  author: "Tristan Partin",
)

#set page(
    /* A4 generally works better since it gives me more vertical space to work
     * with but alas, the world is 8.5in x 11in.
     */
    paper: "us-letter",
    margin: (x: style.MARGIN, y: style.MARGIN),
)

#set text(
  size: style.DEFAULT_TEXT_SIZE,
  font: "Cantarell",
)

#let me = yaml("data/me.yml")

#stack(
  spacing: 10pt,
  heading[#text(size: 17pt)[#upper[#me.name]]],
  text(size: style.TITLE_TEXT_SIZE)[
    #style.accent[
      #link(<recent-experience>)[
        #experience.recent.title \@ #experience.recent.company.name
      ]
    ]
  ],
  attributes.content,
  grid(
    columns: (0.60fr, 0.40fr),
    column-gutter: 20pt,
    [
      #experience.content
    ],
    [
      #education.content
      #skills.content
      #projects.content
      #awards-certs.content
    ],
  ),
)
