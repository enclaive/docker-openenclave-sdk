# Copyright (c) Open Enclave SDK contributors.
# Licensed under the MIT License.

include ../config.mk

CFLAGS=$(shell pkg-config oehost-$(COMPILER) --cflags)
LDFLAGS=$(shell pkg-config oehost-$(COMPILER) --libs)
INCDIR=$(shell pkg-config oehost-$(COMPILER) --variable=includedir)

build:
	@ echo "Compilers used: $(CC), $(CXX)"
	oeedger8r ../helloworld.edl --untrusted \
		--search-path $(INCDIR) \
		--search-path $(INCDIR)/openenclave/edl/sgx
	#$(CC) -g -fPIC -c $(CFLAGS) host.c
	#$(CC) -g -fPIC -c $(CFLAGS) helloworld_u.c
	#$(CC) -shared -o libhost.so helloworld_u.o host.o $(LDFLAGS)
	$(CC) -g -fPIE -c $(CFLAGS) host.c
	$(CC) -g -fPIE -c $(CFLAGS) helloworld_u.c
	ar -rcs libhost.a helloworld_u.o host.o
	ranlib libhost.a

clean:
	rm -f libhost.a host.o helloworld_u.o helloworld_u.c helloworld_u.h helloworld_args.h
