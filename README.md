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

To rebuild the PDF on every save, start the watcher:

```shell
devenv up
```

The PDF is written to `$DEVENV_STATE/preview/resume.pdf` (the `file://` path is
printed on startup).
