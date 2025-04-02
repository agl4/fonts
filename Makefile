SHELL := /bin/bash
UNAME := $(shell uname)
ifeq ($(UNAME), Darwin)
        export FONTDIR=${HOME}/Library/Fonts/
else
        export FONTDIR=${HOME}/.fonts/
        export TERMINAL=gnome-terminal
endif

FONT_TARGETS :=
include make/versions.mk
include make/aporetic.mk
include make/iosevka.mk
include make/iosevka-aile.mk
include make/input.mk

.PHONY : update-fc-cache
update-fc-cache :
ifeq ($(UNAME), Linux)
	@fc-cache -fv
	@echo "Done."
else
	@echo "Done."
endif

.PHONY : create-fontdir
create-fontdir :
	mkdir -p $FONTDIR || true

.PHONY : install
install : $(FONT_TARGETS)
	@$(MAKE) update-fc-cache
