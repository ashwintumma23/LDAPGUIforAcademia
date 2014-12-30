<%@page import="java.io.*"%>

<html>
	<head>
		<title> .: LDAP GUI for Academic Institutes :. Get Values from user</title>
	 
	</head>

<body>


<%!
	String CollegeName;
	String Domain;
	int deptno;
	
%>

<%
	// Get Values from the previous form
	CollegeName=request.getParameter("Clgname");
	Domain=request.getParameter("domain");
	deptno=Integer.parseInt(request.getParameter("DeptNo"));
	
%>

	
	<font color="darkblue">
		<h1 align=center>LDAP GUI for Academic Institutes</h1>
	</font>
	

	
<center>
<form action="GetConfig.jsp">


<!--

	Simply carry these values forward to the next page
-->
	<input type="hidden" name="Clgname" value="<%=CollegeName%>">
	<input type="hidden" name="domain" value="<%=Domain%>">
	<input type="hidden" name="DeptNo" value="<%=deptno%>">


	<h3 align="center">
		.: Server Software Installation for <font color="green"><%=CollegeName%></font> :.
	</h3>
	<h4 align="center">Installing OpenLDAP and Berkeley DB</h4>

	</br>
	<font face="Verdana" size="3pt">
	
	Following Softwares will be installed on your machine 
	<ul>
		<li>	OpenLDAP - 2.3.30	</li>
		<li>	Berkeley DB - 4.3.29	</li>
	</ul>


	Run the Script named <b>Install.sh</b> from the Scripts Directory
	<br>	<br>
		.:Notes:. 	
		<ul>		
		<li> You need to run the script as a <i>sudo</i> user		</li>				
		<li> Other details of the file execution are available in the file itself </li>
		</ul>


		<b>How to execute :</b> <br>
	<tt>	sudo bash &lt;path_of_directory&gt;/Install.sh

	</tt>
<br><br>
	If the script ran successfully [i.e. with an exit status of 0], then above softwares are installed correctly. <br>
	Now, you need to customize the configuration of the server.
<br><br>
	</font>	

	<font face="Verdana" size="1pt">
	<i>	The reason we have not executed the shell script from this webpage is that, if done so, the user wouldn't have got to see the actual compilation process of the Server Software Installation. 
	</i>
		</font>	
	
<br>
		
	<input type="Submit" Value="Start Configuration"> 
		
	</form>
	</center>
</body>
</html>

