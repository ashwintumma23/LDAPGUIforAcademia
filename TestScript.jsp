<%@page import="java.io.*"%>
<%
Runtime r=Runtime.getRuntime();
Process p=null;
String cmd="/usr/local/apache-tomcat-6.0.29/webapps/ROOT/test.sh Ashwin Tumma";
try{
p=r.exec(cmd);

InputStreamReader isr=new InputStreamReader(p.getInputStream());
BufferedReader br=new BufferedReader(isr);
String line=null;
while((line = br.readLine()) != null){
out.write(line);
}



p.waitFor();
}
catch(Exception e){
out.println(e);
}
//out.write(p.exitValue());
%>

