# Airsoft Explosive Language [ASEL]

Domain-Specific Language (DSL) for easy creation of programs designed to simulate a sports explosive device in an [Airsoft](https://en.wikipedia.org/wiki/Airsoft) setting.

ASEL is a language that translates to Arduino Language notation compatible with many development boards on the market. Syntax is simplified and oriented towards specific use, most notably very short remote control designs and powerful interfacing with external devices (speakers, LEDs, sensors).

`raw` functionality is also available, allowing raw Arduino Language code to be written within ASEL. Designed for development purposes and more advanced use than ASEL itself supports.

ASEL is created using [Eclipse](https://www.eclipse.org/)'s [Xtext](https://www.eclipse.org/Xtext/) for syntax and [Xtend](https://www.eclipse.org/xtend/) for semantics. Additionally leveraging Eclipse's tools, comes with IDE support.


### Setup

**Dependencies:**
- [Eclipse](https://www.eclipse.org/) _(JRE/JDK **11**)_
  - [Xtext](https://www.eclipse.org/Xtext/) IDE _(Plug-In)_
  - [Xtend](https://www.eclipse.org/xtend/) IDE _(Plug-In)_



## ASEL Project

### Building

ASEL Generator translates ASEL code into C++ code, oriented for use with PlatformIO (but not necessarily).

At this time, further manual configuration is required to build a project. For now, `make` is used to ease performing required actions. ASEL Project Templates already generates a suitable `Makefile` with user-inputted board IDs.

- `$ make init` to initialize the project
- `$ make` to build
- `$ make upload` to build and upload to board
- `$ make clean` to clean the project

Install any libraries using [PlatfromIO CLI](http://docs.platformio.org/en/latest/core.html#piocore).

PlatformIO files are generated with `$ make init`, they may be added to `.gitignore` and regenerated as long as no manual changes are made to `platformio.ini`. All files generated with ASEL Project Templates should however be versione controlled.
