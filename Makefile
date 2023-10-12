CC=gcc
RM=rm

CFLAGS=-c -Wall
LDFLAGS=

DESTDIR=
BINDIR=/usr/bin

SOURCES=hello.c helloworld.c
OBJECTS=$(SOURCES:.c=.o)

EXECUTABLE=helloremotetar

.cpp: .o
	$(CC) $(CFLAGS) $< -o $@

all: $(SOURCES) $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS)
	$(CC) $(LDFLAGS) $^ -o $@

clean:
	$(RM) -f $(EXECUTABLE) *.o

install: $(EXECUTABLE)
	mkdir -p $(DESTDIR)/$(BINDIR)
	install -m 0755 $< $(DESTDIR)/$(BINDIR)
