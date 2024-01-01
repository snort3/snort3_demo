.PHONY: build sid_3-13.h install clean

build: sid_3_13.h
	cmake -B build/ -G Ninja .
	cmake --build build/

sid_3_13.h: sid_3_13.txt
	snort --rule-to-text < sid_3_13.txt > sid_3_13.h

install:
	cmake --install build/

clean:
	rm sid_3_13.h
	rm -rf build/
	rm -rf install/
