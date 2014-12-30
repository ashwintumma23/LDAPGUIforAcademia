LDAP GUI for Academic Institutes.
---------------------------------

Graphical User Interface for installing and configuring LDAP Service for Academic Institutes

Developed at : Department of Computer Engineering and Information Technology, College of Engineering, Pune, Maharashtra, India. November 2010

Developers : 	Ashwin Tumma - ashwin.tumma23@gmail.com
		Swapnil Kulkarni - swapnil514@gmail.com

Pre-requistes: 
---------------------
Read PREREQUISTE file


List of files: 
------------------
LDAP Directory : 
------------------
README.txt : Readme file for the tool 
index.html : HomePage for the tool. You can select either Server or Client to configure from this page
Client.html : Describes the installation procedure for the LDAP clients. The user is adviced to read this page throughly before proceeding with Client installation 
GetValues.html : Get the values of basic parameters from the user and store these values in the tool for further configurations and settings.
SubmitValues.jsp : Procedure for installation of server softwares.
GetConfig.jsp : Create the slapd.conf file and request for the department specific information from the user. 
Configure.jsp : Create the  hierarchy and group files to build the directory information tree.
ServerStartAdding.jsp : Start the ldap server and add the various ldif files created during the installation process.
CreateUsers.html : Procedure for adding end users to the server database.
Developers.html : Details and contacts of the developers. 

Scripts Directory : 
-----------------
	This directory contains the shell scripts for automating the installation process. 
	Install.sh : Install server softwares - OpenLDAP and Berkeley Database
	Make_slapd_conf.sh : Create the slapd file and place it in its appropriate position 
	CreateLDIF.sh: Creation of directory information tree.
	ServerStart.sh : Start the server and add the ldif files to the server database
	Client.sh : Installing the clients
	1.ldif : Sample end user ldif file
	UserAdd.sh : Add end users 
	
	ClientFiles Directory :
	----------------------
	common-* : client authentication files
	nsswitch.conf: Name Service Switch file for client configuration.
		

