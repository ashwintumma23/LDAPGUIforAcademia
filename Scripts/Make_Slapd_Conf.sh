#!/bin/bash

# LDAP GUI for Academic Institutes
# Graphical User Interface for installing and configuring LDAP Service for Academic Institutes

# Developed at : Department of Computer Engineering and Information Technology, College of Engineering, Pune, Maharashtra, India. November 2010

# File Description : 
        # This file creates a slapd.conf file for the LDAP Server. slapd.conf file is main configuration of the LDAP Server wherein, all the Server Configurations are placed. 

        # Wherever possible, we have included comments so that it becomes easier for the user/administrator to understand what exactly is going on whilst installation.

        # Other details about references, and other approaches to installation are presented in Chapter 7 of our report. 

	# Command Line Parameters to this file: 
		# $1 -> domain name of the server's root 
	# Output : 
		# Outputs a slapd.conf file which is placed at /usr/local/etc/openldap/slapd.conf


#echo $1


# Include the various header schemas that are used by LDAP
# ---------------------------------------------------------------
echo "include /usr/local/etc/openldap/schema/core.schema">slapd.conf
echo "include /usr/local/etc/openldap/schema/cosine.schema">>slapd.conf
echo "include /usr/local/etc/openldap/schema/inetorgperson.schema">>slapd.conf
echo "include /usr/local/etc/openldap/schema/nis.schema">>slapd.conf

echo "pidfile         /usr/local//var/run/slapd.pid">>slapd.conf
echo "argsfile        /usr/local//var/run/slapd.args">>slapd.conf


# Create/Set the name of the LDAP Server's Root Domain Name [rootdn]
# ---------------------------------------------------------------

echo "database	bdb">>slapd.conf
echo "suffix	\"$1\"">>slapd.conf
echo "rootdn	\"cn=Manager,$1\"">>slapd.conf
echo "rootpw	secret">>slapd.conf
echo "directory       /usr/local//var/openldap-data">>slapd.conf
# Comments: We have set the name of the root domain for our LDAP Server as "Manager". You can chose your own domain name [rootdn]. Please note, you will have to replicate the changes in further steps of installation[wherever there is occurence of the rootdn] also.




echo "#Indices:">>slapd.conf
echo "index	objectClass	eq">>slapd.conf
echo "index 	uid	eq">>slapd.conf


#cat slapd.conf

# Copy the file from current directory and place it in the settings directory
# ----------------------------------------------------------------------------------
mkdir -p /usr/local/etc/openldap/
cp -f ./slapd.conf /usr/local/etc/openldap/slapd.conf

