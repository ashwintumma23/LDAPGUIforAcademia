<%@page import="java.io.*, java.util.StringTokenizer"%>

<html>
	<head>
		<title> .: LDAP GUI for Academic Institutes :. Get Values from user</title>
	 
	</head>

<body>


<%!
	String CollegeName;
	String Domain, Domain1;
	int deptno;
	String dn;
	StringTokenizer stz,stz1;
	
%>

<%
	// Get Values from the previous form
	CollegeName=request.getParameter("Clgname");
	Domain=request.getParameter("domain");
	deptno=Integer.parseInt(request.getParameter("DeptNo"));
	Domain1=Domain;
		
	int re=Domain.indexOf(',');
	if(re==-1)
	{
		// Comma is not present means, only one value. E.g.: dc=coep
	
		Domain1+="=";
		stz=new StringTokenizer(Domain1,"=");
		stz.nextToken();
		dn=stz.nextToken();
		
	}
	else
	{
		stz1=new StringTokenizer(Domain1,",");
		
		String temp=stz1.nextToken();
		temp+="=";
		
		stz1=new StringTokenizer(temp,"=");
		stz1.nextToken();
		dn=stz1.nextToken();
		//out.println(stz1.nextToken());
	}
	//out.println("DN IS : "+dn);

%>


	<font color="darkblue">
		<h1 align=center>LDAP GUI for Academic Institutes</h1>
	</font>
	

<center>


<!--
	Run the Make_slapd_conf.sh file here
-->
	
	<h4 align="center">
		.: Slapd file creation Status:.
	</h4>
<%
	Runtime r=Runtime.getRuntime();
	Process p=null;
	String cmd="/usr/local/apache-tomcat-6.0.29/webapps/ROOT/LDAP/Scripts/Make_Slapd_Conf.sh "+Domain;
	//out.println(cmd);
	
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
	out.println("/usr/local/etc/openldap/slapd.conf created successfully with domain name: </font><font color=darkblue>"+Domain+"</font>");
	
}
catch(Exception e){ 
	out.println("<font color=red>");
	out.println("Error in creating slapd.conf with domain name: </font><font color=darkblue>"+Domain+"</font>");
out.println("The Error is : "+e);
out.println("Error Message End");
}
	
%>

	<h4 align="center">
		.: Enter <%=CollegeName%> Server Configuration Details :.
	</h4>

<form action="Configure.jsp">


<!--

        Simply carry these values forward to the next page
-->
        <input type="hidden" name="Clgname" value="<%=CollegeName%>">
        <input type="hidden" name="domain" value="<%=Domain%>">
        <input type="hidden" name="DeptNo" value="<%=deptno%>">
        <input type="hidden" name="dn" value="<%=dn%>">




	Note: In this form, please enter all the configuration details that you want to be reflected in your LDAP Server Installation for your institute. 	
	
	

	<br>
	<br>
	<table border=0 align="center">
	<tr>
		<th>Parameter</th>

		<th> Value</th>
		<th> Notes/Example</th>
	</tr>

	<tr>			
	<td colspan="3">
	<b></b>
	</td>
	</tr>
	
	<tr>			
	<td colspan="3">
	<b><font color="brown">Details for building Directory Information Tree</font></b>
	</td>
	</tr>
	
	
	<tr>			
	<td colspan="3">
	<b><font color="darkblue">Enter Department Names</font></b>
	</td>
	</tr>

	
	<%
		int i=1;
		while(i<=deptno)
		{
			out.println("<tr><td>Department No. : "+i+"</td><td><input type='textbox' size='20' name="+i+"></td></tr>");
		i++;
		}
	%>

	

	<tr>	
		<td rowspan="2" colspan="3" align="center" valign="middle"><input type="Submit" value="Build Directory Information Tree"></td>
	</tr>
	</table>
	
	
	</form>
	</center>
</body>
</html>

