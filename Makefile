TARGET   = cydo
OUTDIR  ?= bin

CC       = xcrun -sdk iphoneos gcc -arch arm64
LDID     = ldid
CHMOD    = chmod

all: $(OUTDIR)/$(TARGET)

$(OUTDIR):
	mkdir -p $(OUTDIR)

$(OUTDIR)/$(TARGET): cydo.c | $(OUTDIR)
	$(CC) -o $@ $^
	$(LDID) -Sent.xml $@
	$(CHMOD) 6755 $@

clean:
	rm -rf $(OUTDIR)
