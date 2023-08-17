# SPDX-License-Identifier: CC0-1.0
#
# SPDX-FileCopyrightText: 2023 Tristan Partin <tristan@partin.io>

RESUME := Tristan_Partin_Resume.pdf

.PHONY: all
all: $(RESUME)

$(RESUME): *.typ data/*.yml sections/*.typ
	@$(MAKE) -s fontawesome
	typst compile resume.typ $(RESUME)

.PHONY: resume
resume: $(RESUME)

.PHONY: fontawesome
fontawesome:
	@./scripts/fontawesome.sh

.PHONY: clean
clean:
	$(RM) $(RESUME)

.PHONY: distclean
distclean: clean
	$(RM) -r fonts
