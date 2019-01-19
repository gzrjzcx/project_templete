#!/bin/bash
TEMP="init_c/temp.txt"
NAME=`cat ${TEMP} | awk '{print $1}'`
DES="src/`cat ${TEMP} | awk '{print $2}'`"
POSTFIX=`cat ${TEMP} | awk '{print $3}'`
DNAME=`echo "${NAME}" | awk '{print toupper($0)}'`
NAME+=.${POSTFIX}

function create_h(){
	if [ -d "${DES}" ]; then
		if [ -f "${NAME}" ]; then
			echo "${NAME} file exists, create ${NAME} FAILURE!!!"
		else
			mkdir -p ${DES}
			echo "#ifndef __${DNAME}_H__" >> ${DES}/${NAME}
			echo "#define __${DNAME}_H__" >> ${DES}/${NAME}
			echo "" >> ${DES}/${NAME}
			echo "" >> ${DES}/${NAME}
			echo "" >> ${DES}/${NAME}
			echo "#endif //__${DNAME}_H__" >> ${DES}/${NAME}
		fi
	else
		echo "${DES} dir not exists, create ${NAME} firstly..."
		mkdir -p ${DES}
		echo "#ifndef __${DNAME}_H__" >> ${DES}/${NAME}
		echo "#define __${DNAME}_H__" >> ${DES}/${NAME}
		echo "" >> ${DES}/${NAME}
		echo "" >> ${DES}/${NAME}
		echo "" >> ${DES}/${NAME}
		echo "#endif //__${DNAME}_H__" >> ${DES}/${NAME}
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
		echo "${DES} dir not exists, create ${NAME} firstly..."
		mkdir -p ${DES}
			echo "#include <stdio.h>" >> ${DES}/${NAME}
			echo "" >> ${DES}/${NAME}
	fi
}

case "${POSTFIX}" in

h)	create_h
	;;

c)	create_c
	;;

*)  NAME+=h	
	create_h
	NAME=`echo "${NAME}" | cut -d'.' -f 1`
	NAME+=.c
	create_c
	;;
esac
		













