# Airsoft Explosive Language [ASEL]

Domain-Specific Language (DSL) for easy creation of programs designed to simulate a sports explosive device in an [Airsoft](https://en.wikipedia.org/wiki/Airsoft) setting.

ASEL is a language that translates to Arduino Language notation compatible with many development boards on the market. Syntax is simplified and oriented towards specific use, most notably very short remote control designs and powerful interfacing with external devices (speakers, LEDs, sensors).

`raw` functionality is also available, allowing raw Arduino Language code to be written within ASEL. Designed for development purposes and more advanced use than ASEL itself supports.

ASEL is created using [Eclipse](https://www.eclipse.org/)'s [Xtext](https://www.eclipse.org/Xtext/) for syntax and [Xtend](https://www.eclipse.org/xtend/) for semantics. Additionally leveraging Eclipse's tools, comes with IDE support.

**Airsoft Explosive _Modeling_ Language [ASEmL]:**

ASEmL is a visual (modeling) sub-language of ASEL, described as an Ecore metamodel in [Eclipse Modeling Framework (EMF)](https://www.eclipse.org/modeling/emf/). It is an improved version of the Xtext-generated metamodel. May once be used in place of the generated one, however currently it is kept separate for experimental purposes.


### Setup

**Dependencies:**
- [Eclipse](https://www.eclipse.org/) _(JRE/JDK **11**)_
  - [Xtext](https://www.eclipse.org/Xtext/) IDE _(Plug-In)_
  - [Xtend](https://www.eclipse.org/xtend/) IDE _(Plug-In)_
  - [Eclipse Modeling Framework (EMF)](https://www.eclipse.org/modeling/emf/) _(Plug-Ins)_ for ASEmL

**Run Configurations:**
- `Generate ASEL.mwe2` generates grammar, generators, stubs, wizards etc.
- `Launch Runtime Eclipse` launches Runtime with all ASEL features enabled (including ASEmL if generated).
- `ASELParsingTest` runs JUnit tests.
- `Launch Standalone Generator` runs ASEL as a standalone program (without Eclipse).
  - Uses `asel.demo.base` demo (`demos` folder) when launched from within Eclipse.
  - _Used for exporting._

**External Tools Configurations:**
- `Build Standalone` exports ASEL generator as a standalone program (runnable JAR file).
  - Target: `org.jonpas.asel/target/ASELStandalone.jar`
  - _Uses Ant build script._

**Modeling Language Generation _`org.jonpas.aseml`_:**
- Edit metamodel with class diagram (`model/ASEmL.aird -> ASEmL.ecore -> ASEmL -> ASEmL`) or Ecore (`model/ASEmL.ecore`).
- Open `model/ASEmL.genmodel` and right-click on root node to Generate Code.
  - _Delete `src-gen` folder in `org.jonpas.aseml` and `org.jonpas.aseml.edit` projects when renaming or deleting items!_

**Obeo Graphical Modeling Workbench _`org.jonpas.aseml.design`_:**
- Develop in new Eclipse instance with EMF Ecore metamodel plugin loaded.
- Edit ASEmL project's model with created representation (`representations.aird -> [ASEmL Sequence]`).

**Acceleo Code Generation _`org.jonpas.aseml.acceleo`_:**
- Develop in new Eclipse instance with EMF Ecore metamodel plugin loaded.
- Generate ASEmL project's code with Run Configurations.


## ASEL Eclipse Project

### Building

ASEL Generator translates ASEL code into C++ code, oriented for use with PlatformIO (but not necessarily).

At this time, further manual configuration is required to build a project. For now, `make` is used to perform required actions. ASEL Project Wizard already generates a suitable `Makefile` with user-inputted board IDs.

- `$ make init` to initialize the project
- `$ make` to build
- `$ make upload` to build and upload to board
- `$ make clean` to clean the project

Install any libraries using [PlatfromIO CLI](http://docs.platformio.org/en/latest/core.html#piocore).

### Version Control

All files generated with ASEL Project Wizard should be version controlled:
- `src` folder (your code)
- `Makefile`
- `.gitignore`

`platformio.ini` file generated with `$ make init` should also be version controlled if libraries are added or manual changes are inserted. Otherwise it may also be regenerated each time using `$ make init` again. All other generated source files are up to developer's discretion if he will use them.

PlatformIO helper files (`.pio` folder) are already ignored if ASEL Project Wizard was used, otherwise they should be added manually.


## ASEL Standalone Project

ASEL Generator can be ran as a standalone program (runnable JAR file) on command line or included in other tools or IDEs.

`ASELStandalone.jar` can be invoked directly with `java`, taking a path to an ASEL project as an argument. ASEL project must contain a `src` folder with a `main.asel` ASEL source file inside it!

`$ java -jar ASELStandalone.jar <path-to-ASEL-project>`

**Examples:**

- `$ java -jar ASELStandalone.jar org.example.myasel`
- `$ java -jar org.jonpas.asel/target/ASELStandalone.jar demos/asel.demo.base`


## ASEmL Project

Create an empty project and add ASEmL Model to it using the generated wizard (`New -> Other... -> ASEmL Model`).

Right-click and select `Validate` to validate the created model.
