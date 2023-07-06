CROSS_COMPILE ?=
DESTDIR ?= tmp/output
CFLAGS ?= -O2
CC = $(CROSS_COMPILE)gcc
INSTALL ?= install

all: resize resize-static

%.o: %.c
	$(COMPILE.c) $(OUTPUT_OPTION) $<

%: %.o
	$(LINK.o) $^ $(LOADLIBES) $(LDLIBS) -o $@

%-static: %.o
	$(LINK.o) $^ $(LOADLIBES) $(LDLIBS) -static -o $@

clean:
	rm -f resize.o resize resize-static

install:
	umask 022
	mkdir -p $(DESTDIR)/usr/bin
	$(INSTALL) -s -m0755 resize $(DESTDIR)/usr/bin/resize-tiny
	$(INSTALL) -s -m0755 resize-static $(DESTDIR)/usr/bin/resize-tiny.static

.PHONY: all install clean
