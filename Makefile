CROSS_COMPILE ?=
DESTDIR ?= tmp/output
CFLAGS ?= -O2
CC = $(CROSS_COMPILE)gcc
INSTALL ?= install

all: resize

%.o: %.c
	$(COMPILE.c) $(OUTPUT_OPTION) $<

%: %.o
	$(LINK.o) $^ $(LOADLIBES) $(LDLIBS) -o $@

clean:
	rm -f resize.o resize

install:
	umask 022
	mkdir -p $(DESTDIR)/usr/bin
	$(INSTALL) -s -m0755 resize $(DESTDIR)/usr/bin/resize-tiny

.PHONY: all install clean
