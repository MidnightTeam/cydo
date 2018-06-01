TARGET   = cydo
OUTDIR  ?= bin

CC       = xcrun -sdk iphoneos g++ -arch arm64
LDID     = ldid
CHMOD    = chmod

SYSROOT  = $(shell xcodebuild -sdk iphoneos -version Path)
FRMWRKS  = $(SYSROOT)/System/Library/PrivateFrameworks

all: $(OUTDIR)/$(TARGET)

$(OUTDIR):
	mkdir -p $(OUTDIR)

$(OUTDIR)/$(TARGET): cydo.cpp | $(OUTDIR)
	$(CC) -isysroot $(SYSROOT) -F$(FRMWRKS) -std=c++11 -o $@ $^
	$(LDID) -S $@
	$(CHMOD) 6755 $@

clean:
	rm -rf $(OUTDIR)
