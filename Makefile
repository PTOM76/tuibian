# Makefile
ISO_NAME=Tuibian
all: clean debs build

clean:
	sudo lb clean

build:
	sudo lb config --iso-volume $(ISO_NAME)
	sudo lb build

debs:
	cd app/fmtui && cargo build --release && cargo deb --target x86_64-unknown-linux-gnu
	cd app/tuibian-menu && cargo build --release && cargo deb --target x86_64-unknown-linux-gnu
	cp app/fmtui/target/debian/*_amd64.deb config/packages/
	cp app/tuibian-menu/target/debian/*_amd64.deb config/packages/
	cp app/fmtui/target/debian/*_amd64.deb config/includes.installer/
	cp app/tuibian-menu/target/debian/*_amd64.deb config/includes.installer/
