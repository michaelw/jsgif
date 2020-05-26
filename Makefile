BBE  = bbe
YASM = yasm
INSTALL = install

DESTDIR  = 
prefix   = /srv/www
sharedir = $(prefix)/jsgif
OUTDIR   = out

.PHONY: all
all: $(addprefix $(OUTDIR)/, js.gif small-js.gif)

$(OUTDIR)/js.gif: test.gif patch.bbe shim.inc js/js1k-1443.js
	$(BBE) -f patch.bbe $< $(OUTPUT_OPTION)

$(OUTDIR)/small-js.gif: gifjs.asm  shim.inc js/js1k-1443.js
	$(YASM) $< $(OUTPUT_OPTION)

.PHONY: install
install: all
	$(INSTALL) -d $(DESTDIR)$(sharedir)/
	$(INSTALL) -m 0644 out/js.gif $(DESTDIR)$(sharedir)/
	$(INSTALL) -m 0644 out/small-js.gif $(DESTDIR)$(sharedir)/
	$(INSTALL) -m 0644 index.html $(DESTDIR)$(sharedir)/

.PHONY: clean
clean:
	$(RM) -r $(OUTDIR)

$(shell mkdir -p $(OUTDIR))
