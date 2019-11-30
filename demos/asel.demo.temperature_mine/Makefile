BOARDS = lolin_d32

all:
	platformio -f run

upload:
	platformio -f run --target upload

clean:
	platformio -f run --target clean

update:
	platformio -f update

init:
	platformio init $(addprefix -b ,$(BOARDS))
	@if ! grep -Fxq "[platformio]" platformio.ini; then \
		echo -e "[platformio]\nsrc_dir = src-gen\n" >> platformio.ini; \
	fi
