#!/bin/bash
DIRS=("includes" "res" "scripts" "src" "obj" "bin" "out")
FILES=("Makefile" "src/main.c" "README.md" "LICENSE")

ERROR=0

for i in `seq -w 0 $((${#DIRS[@]}-1))`
do
	# check if dir exists
	if [ ! -d "${DIRS[${i}]}" ]; then
		echo "${DIRS[${i}]} dir not exist!!!"
		ERROR=1
	else
		# check existent dir if is empty
		# note if dir not exist, it's viewed as this dir is empty 
		if [ -n "$(find ${DIRS[${i}]} -maxdepth 5 -empty -type d 2>/dev/null)" ]; then
			echo "${DIRS[${i}]} or ${DIRS[${i}]}/subdirs is empty!!!!!!"
			ERROR=1
		fi
	fi
done

for j in `seq -w 0 $((${#FILES[@]}-1))`
do
	if [ ! -f "${FILES[${j}]}" ]; then
		echo "${FILES[${j}]} file not exist!!!"
		ERROR=1
	fi
done

case "${ERROR}" in

1) 	echo -e "Can not pass submitting check, please check by hand..."
	;;

0)	echo -n "Pass submitting check, do you want to delete init dir? [yes or no]:"
	read yno
	case ${yno} in

		[yY]|[yY][Ee][Ss])	rm -rf init
							rm -rf .git
							echo "All init files are removed, please do not forget to rename project directory"
							;;

		[nN]|[n|N][O|o]) 	echo "Not do any thing"
							exit 1
							;;

		*) echo "invalid input";;
	esac
	;;

esac
