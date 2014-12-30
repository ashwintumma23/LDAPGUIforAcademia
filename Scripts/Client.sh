#!/bin/bash

# LDAP GUI for Academic Institutes
# Graphical User Interface for installing and configuring LDAP Service for Academic Institutes

# Developed at : Department of Computer Engineering and Information Technology, College of Engineering, Pune, Maharashtra, India. November 2010

# File Description : 
        # This file is used to configure the machiiens such that they can act as a client to the configured server machine. 

        # Wherever possible, we have included comments so that it becomes easier for the user/administrator to understand what exactly is going on whilst installation.

        # Other details about references, and other approaches to installation are presented in Chapter 7 of our report. 

        # Command Line Parameters to this file: 
                # None 
        # Output : 
                # All the configuration files that are required for configuring a client are placed in the appropriate directory.


# Comments/ Explanation : 
	# For a machine to act as an ldap client you need to edit the following files : 	
		# /etc/nsswitch.conf 
		# /etc/pam.d/common-auth 
		# /etc/pam.d/common-account
		# /etc/pam.d/common-session
		# /etc/pam.d/common-password
	
	# Why are need to do so? 
		# By editing the /etc/nsswitch.conf file we are informing the client system that it should set its authentication mode such that its users shall be authenticated locally or from the LDAP Server.
		
		# For LDAP Client Authentication we are using Pluggable Authentication Modules[PAM] which are available in the /etc/pam.d directory. And on that directory we are editing the 4 files, so as to let the client machine know that how it shall access the server. Further explanation of the client files is beyond the scope of this tool. Kindly refer to any website on PAM and you will get to know the details of the files.
		
		
		
# File Starts here


# Backup nsswitch.conf
cp /etc/nsswitch.conf /etc/nsswitch.conf.bak

# Backup /etc/pam.d/common-* files to /etc/pam.d/backup_common_files/ directory
mkdir /etc/pam.d/backup_common_files/
cp /etc/pam.d/common-* /etc/pam.d/backup_common_files/

# Our nsswitch.conf file in current directory copied 
cp ./ClientFiles/nsswitch.conf /etc/

# Copy our common-* files to /etc/pam.d/
cp ./ClientFiles/common-* /etc/pam.d/
