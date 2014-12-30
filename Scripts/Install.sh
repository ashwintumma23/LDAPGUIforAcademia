#!/bin/bash

# LDAP GUI for Academic Institutes
# Graphical User Interface for installing and configuring LDAP Service for Academic Institutes

# Developed at : Department of Computer Engineering and Information Technology, College of Engineering, Pune, Maharashtra, India. November 2010

# File Description : 
	# This file is the installation shell script for installating Oracle Berkeley DB and OpenLDAP Software packages on the server machine. We are using the latest compatible versions in this installation, but they can always be modified as per the users' requirements.

	# The two tar.gz files that are required for installation of the softwares are present in the current directory itself. If users modify the location of those files, then this script needs to be changed accordingly. 

	# Wherever possible, we have included comments so that it becomes easier for the user/administrator to understand what exactly is going on whilst installation.

	# Other details about references, and other approaches to installation are presented in Chapter 7 of our report. 
	
	# Command Line Parameters to this file: 
		# None
		# But the values of the tar.gz file can be taken as command line parameters to the script and the script can be changed accordingly. To do so, you only need to replace the 'hardcoded' names of the two tar.gz files by the commmand line parameters like $1 and $2
	


# Create a directory /extra wherein both the tarballs will be kept.
# ---------------------------------------------------------------------
mkdir /extra

# Copy the tarballs from this directory to /extra
# ------------------------------------------------
cp db-4.3.29.tar.gz /extra
cp openldap-2.3.30.tgz /extra
cd /extra

# Start Oracle Berkeley DB Installation 
# ---------------------------------------

tar -xvvf db-4.3.29.tar.gz
cd db-4.3.29/build_unix/
../dist/configure --prefix=/usr/local
make
make install

# Start OpenLDAP Server Installation 
# ---------------------------------------

cd /extra
tar -xvvf openldap-2.3.30.tgz
cd openldap-2.3.30/
export LD_LIBRARY_PATH=/extra/db-4.3.29/build_unix/.libs
./configure --prefix=/usr/local
make depend
make
make install

