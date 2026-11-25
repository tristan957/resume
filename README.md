<!--
SPDX-License-Identifier: CC0-1.0

SPDX-FileCopyrightText: Tristan Partin <tristan@partin.io>
-->

<!-- markdownlint-disable-next-line MD041 -->
[![builds.sr.ht status](https://builds.sr.ht/~tristan957/resume.svg)](https://builds.sr.ht/~tristan957/resume?)

# Resume

This is my resume written in [Typst](https://typst.app). A compiled PDF is
hosted on my
[personal website](https://tristan.partin.io/documents/Tristan_Partin_Resume.pdf).

## Building

With [devenv](https://devenv.sh) installed:

```shell
devenv build outputs.resume
```

This builds the PDF into the Nix store and prints the path to the output
directory, which contains `resume.pdf`. Fonts (Cantarell and Font Awesome) are
provided by Nix, so no manual setup is needed.

For development, `devenv shell` provides `typst` and `typstyle` with the fonts
already configured, so `typst compile resume.typ` works directly.

## Previewing

To preview the PDF in a browser, start the web server in the background:

```shell
devenv up -d
```

The resume is then available at <http://localhost:7777/resume.pdf>. Stop the
server with `devenv processes down`.

To use a different port, create a `devenv.local.nix` (ignored by git):

```nix
{resume.port = 8080;}
```
