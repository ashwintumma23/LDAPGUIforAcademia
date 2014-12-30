<%@page import="java.io.*, java.util.StringTokenizer"%>

<html>
	<head>
		<title> .: LDAP GUI for Academic Institutes :. Start LDAP Server and add ldif files to it </title>
	 
	</head>

<body>


<%!
	String CollegeName;
	String Domain;
	int deptno;
	String dn;
	String dept="";
	String deptname[]=new String[20];
	String file[]=new String[20];
%>

<%
	dept="";
	// Get Values from the previous form
	CollegeName=request.getParameter("Clgname");
	Domain=request.getParameter("domain");
	deptno=Integer.parseInt(request.getParameter("DeptNo"));
	dn=request.getParameter("dn");

	for(int k=1;k<=deptno+4;k++)    
                {   
                        
			file[k]=request.getParameter(Integer.toString(k));
			if(k>4)
			{
				dept+="/usr/local/apache-tomcat-6.0.29/webapps/ROOT/LDAP/Scripts/"+file[k]+" ";
			}
                }   
    

%>



	<font color="darkblue">
		<h1 align=center>LDAP GUI for Academic Institutes</h1>
	</font>
	

<center>


<!--
	Run the Make_slapd_conf.sh file here
-->
	
	<h4 align="center">
		.: Server Running Status:.
	</h4>
<%
	Runtime r=Runtime.getRuntime();
	Process p=null;
	String path="/usr/local/apache-tomcat-6.0.29/webapps/ROOT/LDAP/Scripts/";
	
	String hierarchy=path+"hierarchy.ldif ";
	String stud=path+"students.ldif ";
	String staff=path+"staff.ldif ";
	String ntstaff=path+"ntstaff.ldif ";
		
	String param="\"cn=Manager,"+Domain+"\" ";
	//out.println("PAARMA IS : "+param);

	
	

	
	String cmd="sudo /usr/local/apache-tomcat-6.0.29/webapps/ROOT/LDAP/Scripts/ServerStart.sh "+deptno+" "+param+hierarchy+stud+staff+ntstaff+dept;
	//out.println("THE COOMMOND EXECUTED IS : "+cmd);

	try{
	p=r.exec(cmd);
	InputStreamReader isr=new InputStreamReader(p.getInputStream());
	BufferedReader br=new BufferedReader(isr);
	String line=null;
	while((line = br.readLine()) != null){
	out.write(line);
	}
	p.waitFor();
	
	out.println("<font color=green>");
	out.println("Server started successfully </font>");
	out.println("<br><br>Following files added to the server <br>");
	out.println("<font color=darkblue>");
	
	for(int k=1;k<=deptno+4;k++)
	{
		out.println(file[k]+"<br>");
	}
	out.println("</font>");
	
	}
	catch(Exception e){ 
	out.println("<font color=red>");
	out.println("Error in Starting Server=darkblue>"+Domain+"</font>");

}
%>

	<br>
	<br>
	<form action="CreateUsers.html">
		<input type="Submit" value="Create Users">
	</form>
	
	</center>



</body>
</html>

