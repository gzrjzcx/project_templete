#!/bin/bash
TEMP="init/temp.txt"
NAME=`cat ${TEMP} | awk '{print $1}'`
POSTFIX=`cat ${TEMP} | awk '{print $3}'`
DNAME=`echo "${NAME}" | awk '{print toupper($0)}'`
NAME+=.${POSTFIX}

function create_h(){
	if [ -d "${DES}" ]; then
		if [ -f "${NAME}" ]; then
			echo "${NAME} file exists, create ${NAME} FAILURE!!!"
		else
			echo "#ifndef __${DNAME}_H__" >> ${DES}/${NAME}
			echo "#define __${DNAME}_H__" >> ${DES}/${NAME}
			echo "" >> ${DES}/${NAME}
			echo "" >> ${DES}/${NAME}
			echo "" >> ${DES}/${NAME}
			echo "#endif //__${DNAME}_H__" >> ${DES}/${NAME}
		fi
	else
		echo "create ${NAME} file FAILURE: directory \"${DES}/\" not exists..."
	fi
}

function create_c(){
	if [ -d "${DES}" ]; then
		if [ -f "${NAME}" ]; then
			echo "${NAME} file exists, create ${NAME} FAILURE!!!"
		else
			mkdir -p ${DES}
			echo "#include <stdio.h>" >> ${DES}/${NAME}
			echo "" >> ${DES}/${NAME}
		fi
	else
		echo "directory \"${DES}/\" not exists, create \"${DES}/\" firstly..."
		mkdir -p ${DES}
			echo "#include <stdio.h>" >> ${DES}/${NAME}
			echo "" >> ${DES}/${NAME}
	fi
}

case "${POSTFIX}" in

h)	DES="`cat ${TEMP} | awk '{print $2}'`"
	create_h
	;;

c)	DES="`cat ${TEMP} | awk '{print $2}'`"
	if [ ! -d "${DES}" ]; then
		echo "create ${NAME} file FAILURE: directory \"${DES}/\" not exists..."
	else
		create_c
	fi
	;;

# new directory will only be created at create_c function. Therefore here must
# create_c firstly.
*)  DES="src/`cat ${TEMP} | awk '{print $2}'`"
	NAME+=c	
	create_c
	NAME=`echo "${NAME}" | cut -d'.' -f 1`
	NAME+=.h
	create_h
	;;
esac
		













