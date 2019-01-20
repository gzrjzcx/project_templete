# project_templete
This is a C project templete, including some scripts to generate some standard directories: *includes/, src/, res/, scripts*, and create .c/.h files rapidly. Additionally, there is a script file to check if the entire file structure is complete, without any files missed.  

**Please note that there is a directory called `init/` which contains the necessory scripts described above. This directory will be asked to delete when you finished submitting checking.**  

The high-level view of the whole file structure is below:

```
├── bin
├── includes
├── obj
├── out
├── res
├── scripts
└── src
```
- `includes\: contains the basic shared .h files like data structure and global macros.`
- `res\: contains the dependent resources or generated resourcese`
- `scripts\: contains the additional scripts like auto-running or auto-ploting`
- `src\: contains all source C files(.h/.c), also including main.c.`
- `bin\: contains all generated executable files.`
- `obj\: contains all generated objective files.`
- `out\: contains all generated output files.`

## Usage
### 1. What is included in the project templete
There are two Makefiles to control the action:
- The `Makefile` outside the `init/` directory is a templete for the future project, however there are also some rules in this `Makefile` to control the inside makefile.
- The `init_c.mk` inside the `init/` directory is the real makefile to create necessary project directories and C files.

There are two bash scripts inside the `inti/` directory:
- `create_c.sh`: Create initialized C files with different passed arguments.
- `submit_check.sh`: Check if the entire file structure is complete, and if there is any directory is empty.

### 2.How to use
Initialize the project, create the necessary directories, and the `main.c` file inside the `src/` dircetory.
```sh
$ make cinit
```
Create the new C files. 
