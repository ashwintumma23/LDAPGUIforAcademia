<%@page import="java.io.*, java.util.StringTokenizer"%>

<html>
	<head>
		<title> .: LDAP GUI for Academic Institutes :. Configuring the Server</title>
	 
	</head>

<body>


<%!
	String CollegeName;
	String Domain;
	int deptno;
	String dn;
	String deptname[]=new String[20];
	String file[]=new String[20];
	String dep="";
	
%>

<%
	int j=5;
	dep="";
	// Get Values from the previous form
	CollegeName=request.getParameter("Clgname");
	Domain=request.getParameter("domain");
	deptno=Integer.parseInt(request.getParameter("DeptNo"));
	dn=request.getParameter("dn");
	for(int i=1;i<=deptno;i++)
	{	
		String whichDept=Integer.toString(i);
		//out.println(whichDept);
		deptname[i]=request.getParameter(whichDept);
		//out.println(deptname[i]);
		if(!deptname[i].equalsIgnoreCase(null))
		{
			dep+=deptname[i]+" ";
			file[j]=deptname[i]+".ldif";
			j++;
		}
	}
	
	

	//out.println("DEPT IS : "+dep);
	
%>
	<font color="darkblue">
		<h1 align=center>LDAP GUI for Academic Institutes</h1>
	</font>
	

<center>


<!--
	Run the Make_slapd_conf.sh file here
-->
	
	<h4 align="center">
		.: Hierarchy and Group file creation Status:.
	</h4>
<%
	Runtime r=Runtime.getRuntime();
	Process p=null;
	String cmd="";
		cmd="sudo /usr/local/apache-tomcat-6.0.29/webapps/ROOT/LDAP/Scripts/CreateLDIF.sh "+Domain+" "+dn+" "+deptno+" "+dep+" students staff ntstaff";


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
	out.println("Hierarchy and group files are created successfully with domain name: </font><font color=darkblue>"+Domain+"</font>");

	out.println("<br><br>");
	out.println("<b>.: Files created are :. </b><br>");
	
	file[1]="hierarchy.ldif";
	file[2]="students.ldif";
	file[3]="staff.ldif";
	file[4]="ntstaff.ldif";
	
	for(int k=1;k<=deptno+4;k++)	
	{
			
		out.println(file[k]+"<br>");
	}
	
//	out.println("<br>hierarchy.ldif<br>students.ldif<br>staff.ldif<br>ntstaff.ldif<br>");
	
		
	
	
}
catch(Exception e){ 
	out.println("<font color=red>");
	out.println("Error in creating hierarchy and group files with domain name: </font><font color=darkblue>"+Domain+"</font>");
out.println("Error Message End");
}

	
%>

	<form action="ServerStartAdding.jsp">
	<br>
	<br>

<!--

        Simply carry these values forward to the next page
-->
        <input type="hidden" name="Clgname" value="<%=CollegeName%>">
        <input type="hidden" name="domain" value="<%=Domain%>">
        <input type="hidden" name="DeptNo" value="<%=deptno%>">
        <input type="hidden" name="dn" value="<%=dn%>">

	<%
		for(int k=1;k<=deptno+4;k++)	
		{
			out.println("<input type=hidden name="+k+" value="+file[k]+">");
		}
	
		
	%>


	<input type="Submit" value="Start Server and Add Files"></td>
	
	
	</form>






	</center>



</body>
</html>

