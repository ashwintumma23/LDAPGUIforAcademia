#!/bin/bash

# LDAP GUI for Academic Institutes
# Graphical User Interface for installing and configuring LDAP Service for Academic Institutes

# Developed at : Department of Computer Engineering and Information Technology, College of Engineering, Pune, Maharashtra, India. November 2010

# File Description : 
        # This file starts the LDAP server and adds all the ldif files to the server forming the directory information tree structure. 

        # Wherever possible, we have included comments so that it becomes easier for the user/administrator to understand what exactly is going on whilst installation.

        # Other details about references, and other approaches to installation are presented in Chapter 7 of our report. 

	# Command Line Parameters to this file: 
		# $1 -> Number of departments 
		# $2 -> domain name
		# $3 -> hierarchy.ldif
		# $4 -> students.ldif
		# $5 -> staff.ldif
		# $6 -> ntstaff.ldif
		# $7 onwards -> ldif files for various departments
	# Output : 
		# Directory Information Tree is created.


# Start the LDAP Server 
# --------------------------------
/usr/local/libexec/slapd

# Add LDIF files to the server 
# --------------------------------------

# The command for adding ldif files to the server is 'ldapadd'. The format is as follows: 
#		ldapadd -f <filename> -x -D domain -w <password>
# 	e.g. To add the hierarchy file: 
# 		ldapadd -f hierarchy.ldif -x -D "cn=Manager, dc=coep,dc=com" -w secret


ldapadd -f $3 -x -D $2 -w secret	# hierarchy.ldif
ldapadd -f $4 -x -D $2 -w secret	# students.ldif
ldapadd -f $5 -x -D $2 -w secret	# staff.ldif
ldapadd -f $6 -x -D $2 -w secret	# ntstaff.ldif

limit=`expr $1 + 7`
i=7
while [ "$i" != "$limit" ] 
        do

		ldapadd -f $i -x -D $2 -w secret
		#echo $i -x -D $2
                i=$[ $i + 1 ]
	done
	




