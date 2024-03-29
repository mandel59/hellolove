archive_files := \
	conf.lua main.lua \
	$(wildcard *.txt) $(wildcard *.ttf)
love_file := hello.love
love_exec := /usr/bin/love
executable := hello

all: build
build: $(love_file)
clean:
	-rm -f $(patsubst %.moon,%.lua,$(wildcard *.moon))
	-rm -f $(love_file) $(executable)
release: $(executable)
run: build
	$(love_exec) $(love_file)
.PHONY: all build clean release run

$(love_file): $(archive_files)
	-rm -f $@
	zip -9 $@ $(archive_files)

$(executable): $(love_file)
	cat $(love_exec) $< > $@
	chmod +x $@

%.lua: %.moon
	moonc $<
