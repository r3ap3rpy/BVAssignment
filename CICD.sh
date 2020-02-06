#!/bin/bash
chmod u+x ./app/initial/mvnw
cd ./app/initial/ && ./mvnw package

echo "Ensuring nosuid option set on /tmp partition (Scored)"  
NOSUID=`mount | grep -E '\s/tmp\s' | grep -v nosuid`
if test -z "$NOSUID" then      
	echo "NOSUID :: PASS" 
else       
	echo "NOSUID :: FAIL, aborting!"       
	exit 1 
fi

echo "Ensure noexec option set on /tmp partition (Scored)"
NOEXEC=`mount | grep -E '\s/tmp\s' | grep -v noexec`
if test -z "$NOEXEC" then         
	echo "NOEXEC :: PASS" 
else         
	echo "NOEXEC :: FAIL, aborting!"         
	exit 1 
fi
echo "Ensure separate partition exists for /var/tmp (Scored)"
SEPVAR=`mount | grep /var/tmp`
if test -z "$SEPVAR" then         
	echo "SEPVAR :: PASS" 
else         
	echo "SEPVAR :: FAIL, aborting!"         
	exit 1 
fi
