#!/bin/bash

# LDAP GUI for Academic Institutes
# Graphical User Interface for installing and configuring LDAP Service for Academic Institutes

# Developed at : Department of Computer Engineering and Information Technology, College of Engineering, Pune, Maharashtra, India. November 2010

# File Description : 
        # This file creates the required hierarchy.ldif and deparment specific ldif files.

        # Wherever possible, we have included comments so that it becomes easier for the user/administrator to understand what exactly is going on whilst installation.

        # Other details about references, and other approaches to installation are presented in Chapter 7 of our report. 

        # Command Line Parameters to this file: 
                # $1 -> domain name  
                # $2 -> dc
                # $3 -> Number of departments
                # $4 -> Onwards, user details
        # Output : 
                # hierarchy.ldif and other ldif files for creating nodes for departments in the directory information tree.


# Remove any previous files
# --------------------------------


rm -rf *.ldif



# Start creating the hierarchy file 
# -----------------------------------
echo "dn: $1" > /usr/local/apache-tomcat-6.0.29/webapps/ROOT/LDAP/Scripts/hierarchy.ldif
echo  "dc: $2" >> /usr/local/apache-tomcat-6.0.29/webapps/ROOT/LDAP/Scripts/hierarchy.ldif
echo "objectClass: top" >> /usr/local/apache-tomcat-6.0.29/webapps/ROOT/LDAP/Scripts/hierarchy.ldif
echo "objectClass: domain" >> /usr/local/apache-tomcat-6.0.29/webapps/ROOT/LDAP/Scripts/hierarchy.ldif


gid=14000
limit=`expr $3 + 4`
i=4
while [ "$i" != "$limit" ] 
	do
		temp=`echo $* | cut -d ' ' -f$i`
		echo "" >> /usr/local/apache-tomcat-6.0.29/webapps/ROOT/LDAP/Scripts/hierarchy.ldif
		echo "dn: ou=$temp,$1" >> /usr/local/apache-tomcat-6.0.29/webapps/ROOT/LDAP/Scripts/hierarchy.ldif
		echo "ou: $temp" >> /usr/local/apache-tomcat-6.0.29/webapps/ROOT/LDAP/Scripts/hierarchy.ldif
		echo "objectClass: top" >> /usr/local/apache-tomcat-6.0.29/webapps/ROOT/LDAP/Scripts/hierarchy.ldif
		echo "objectClass: organizationalUnit" >> /usr/local/apache-tomcat-6.0.29/webapps/ROOT/LDAP/Scripts/hierarchy.ldif
		echo "">> /usr/local/apache-tomcat-6.0.29/webapps/ROOT/LDAP/Scripts/hierarchy.ldif
		echo "dn: cn=$temp,ou=Group,$1">/usr/local/apache-tomcat-6.0.29/webapps/ROOT/LDAP/Scripts/$temp.ldif
		echo "objectClass: posixGroup">>/usr/local/apache-tomcat-6.0.29/webapps/ROOT/LDAP/Scripts/$temp.ldif
		echo "objectClass: top">>/usr/local/apache-tomcat-6.0.29/webapps/ROOT/LDAP/Scripts/$temp.ldif
		echo "cn: $temp">>/usr/local/apache-tomcat-6.0.29/webapps/ROOT/LDAP/Scripts/$temp.ldif
		echo "userPassword: test">>/usr/local/apache-tomcat-6.0.29/webapps/ROOT/LDAP/Scripts/$temp.ldif
		echo "gidNumber: $gid">>/usr/local/apache-tomcat-6.0.29/webapps/ROOT/LDAP/Scripts/$temp.ldif
			
		
		gid=$[ $gid + 1 ]

		j=$[ $3 + 3 ]
		while [ $j -ne $# ]
			do
				j=$[ $j + 1 ]
				temp1=`echo $* | cut -d ' ' -f$j`
				echo "dn: ou=$temp1,ou=$temp,$1" >> /usr/local/apache-tomcat-6.0.29/webapps/ROOT/LDAP/Scripts/hierarchy.ldif
				echo "ou: $temp1">> /usr/local/apache-tomcat-6.0.29/webapps/ROOT/LDAP/Scripts/hierarchy.ldif
				echo "objectClass: top" >> /usr/local/apache-tomcat-6.0.29/webapps/ROOT/LDAP/Scripts/hierarchy.ldif
				echo "objectClass: organizationalUnit" >> /usr/local/apache-tomcat-6.0.29/webapps/ROOT/LDAP/Scripts/hierarchy.ldif
				echo "" >> /usr/local/apache-tomcat-6.0.29/webapps/ROOT/LDAP/Scripts/hierarchy.ldif
			done
		
		i=$[ $i + 1 ]
		
	done
	j=$[$3 + 3 ]
	while [ $j -ne $# ]
		do 
			j=$[ $j + 1 ]
			temp1=`echo $* | cut -d ' ' -f$j`
			echo "dn: cn=$temp1,ou=Group,$1">/usr/local/apache-tomcat-6.0.29/webapps/ROOT/LDAP/Scripts/$temp1.ldif
			echo "objectClass: posixGroup">>/usr/local/apache-tomcat-6.0.29/webapps/ROOT/LDAP/Scripts/$temp1.ldif
			echo "objectClass: top">>/usr/local/apache-tomcat-6.0.29/webapps/ROOT/LDAP/Scripts/$temp1.ldif
			echo "cn: $temp1">>/usr/local/apache-tomcat-6.0.29/webapps/ROOT/LDAP/Scripts/$temp1.ldif
			echo "userPassword: test">>/usr/local/apache-tomcat-6.0.29/webapps/ROOT/LDAP/Scripts/$temp1.ldif
			echo "gidNumber: $gid">>/usr/local/apache-tomcat-6.0.29/webapps/ROOT/LDAP/Scripts/$temp1.ldif
			gid=$[ $gid + 1 ]
			
		done
	 

echo "dn: ou=Group,$1">> /usr/local/apache-tomcat-6.0.29/webapps/ROOT/LDAP/Scripts/hierarchy.ldif
echo "ou: Group">> /usr/local/apache-tomcat-6.0.29/webapps/ROOT/LDAP/Scripts/hierarchy.ldif
echo "objectClass: top">> /usr/local/apache-tomcat-6.0.29/webapps/ROOT/LDAP/Scripts/hierarchy.ldif
echo "objectClass: organizationalUnit">> /usr/local/apache-tomcat-6.0.29/webapps/ROOT/LDAP/Scripts/hierarchy.ldif

