# project_template
This is a C project template, including some scripts to generate some standard directories: *includes/, src/, res/, scripts*, and create .c/.h files rapidly. Additionally, there is a script file to check if the entire file structure is complete, without any files missed.  

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
- `res\: contains the dependent resources or generated resources`
- `scripts\: contains the additional scripts like auto-running or auto-plotting`
- `src\: contains all source C files(.h/.c), also including main.c.`
- `bin\: contains all generated executable files.`
- `obj\: contains all generated objective files.`
- `out\: contains all generated output files.`

## Usage
### 1. What is included in the project template
There are two Makefiles to control the action:
- The `Makefile` outside the `init/` directory is a template for the future project, however there are also some rules in this `Makefile` to control the inside makefile.
- The `init_c.mk` inside the `init/` directory is the real makefile to create necessary project directories and C files.

There are two bash scripts inside the `inti/` directory:
- `create_c.sh`: Create initialized C files with different passed arguments.
- `submit_check.sh`: Check if the entire file structure is complete, and if there is any directory is empty.

### 2.How to use --- create C files
Initialize the project, create the necessary directories, and the `main.c` file inside the `src/` directory.
```sh
$ make cinit
```
Create the new C files. There are 3 different methods to create .h or .c files:
```sh
$ make cnew [name] [path] [flag]
```
The default situation is that new files are created inside the `src/` directory, in other words, the default path is `src/[path]` . If there is no flag passed to specify which file(.h/.c) is created, it is default situation, and now both .c file and .h file will be created with passed `[name]`. For example, if we want to create `dog.h and dog.c` files inside `zoo/` directory:
```sh
$ make cnew dog zoo
```
If we want to only create .h or .c file, we can pass `h` or `c` parameter to the command line.  
**Please note that in this situation we must explicitly specify the entire path, and the passed directory must exist.**  
For example, if we want to create `resource.h` inside `includes/` directory:
```sh
$ make cnew resource includes h
```
The other difference between this situation and default situation is that here the specified directory must exist, if not, it will print the error message. However, in the default situation, if the directory not exist, it will be created firstly inside `src/` directory.

In terms of testing the function of these scripts, there is a `cclean_` rule for removing all created directories rapidly:
```sh
$ make cclean_
```
### 3. How to use --- submit checking
The script `submit_check.sh` will check if the standard file structure is complete. In other words, if there is any created necessary directory missed or if there is any directory is empty, and then it will be printed to terminal. Additionally, it also can check if the necessary tools like `Makefile` or `README` is missed. If all of them are included in our project, it means that you have passed the check, and then it will prompt you that if need to delete the `init/` directory, because in fact it not belong our project.
```sh
make submitcheck
```
**Please do not forget to change the name of your project directory. :speak_no_evil:**
