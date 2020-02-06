#!/bin/bash
chmod u+x ./app/initial/mvnw
cd ./app/initial/ && ./mvnw package

echo "Ensuring nosuid option set on /tmp partition (Scored)"  
NOSUID=`mount | grep -E '\s/tmp\s' | grep -v nosuid`
if test -z "$NOSUID"; then      
	echo "NOSUID :: PASS" 
else       
	echo "NOSUID :: FAIL, aborting!"       
	exit 1 
fi

echo "Ensure noexec option set on /tmp partition (Scored)"
NOEXEC=`mount | grep -E '\s/tmp\s' | grep -v noexec`
if test -z "$NOEXEC"; then         
	echo "NOEXEC :: PASS" 
else         
	echo "NOEXEC :: FAIL, aborting!"         
	exit 1 
fi
echo "Ensure separate partition exists for /var/tmp (Scored)"
SEPVAR=`mount | grep /var/tmp`
if test -z "$SEPVAR"; then         
	echo "SEPVAR :: FAIL, aborting!"
	exit 1
else         
	echo "SEPVAR :: PASS" 
fi
echo "Ensuring separate partition exists for /var/log (Scored)"
SEPLOG=`mount | grep /var/log`
if test -z "$SEPLOG"; then         
	echo "SEPLOG :: FAIL, aborting!"         
	exit 1 
else         
	echo "SEPLOG :: PASS" 
fi
echo "Ensure separate partition exists for /var/log/audit (Scored)"
SEPAUDIT=`mount | grep /var/log` 
if test -z "$SEPAUDIT"; then
	echo "SEPAUDIT :: FAIL, aborting!"         
	exit 1 
else         
	echo "SEPAUDIT :: PASS" 
fi
cd ../../
docker build -t spring .
if [ "`docker system info | grep -E 'Username|Registry'|wc -l`" -eq "2" ]; then
	echo "logged in"
else
	echo "No login detected aborting!"
	exit 1
fi
