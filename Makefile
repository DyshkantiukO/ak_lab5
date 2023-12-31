
ifneq ($(KERNELRELEASE),)
include Kbuild
else
# normal makefile
KDIR ?= /lib/modules/`uname -r`/build

default:
	$(MAKE) -C $(KDIR) M=$$PWD
	cp hello.ko hello.ko.unstripped
	$(CROSS_COMPILE)strip -g hello.ko # strip only debugging info
clean:
	$(MAKE) -C $(KDIR) M=$$PWD clean

endif
