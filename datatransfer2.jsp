<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="java.sql.*"
    
    %>

<%

String company_name=request.getParameter("company_name");
String location=request.getParameter("location");
String experience=request.getParameter("experience");
String skill=request.getParameter("skill");
String salary=request.getParameter("salary");
String job_description=request.getParameter("job_description");


try{
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/getwings", "root", "root");
	
	PreparedStatement ps=conn.prepareStatement("insert into postjob (company_name, location, experience, skill , salary, job_description)values(?,?,?,?,?,?)");
	ps.setString(1, company_name);
	ps.setString(2, location);
	ps.setString(3, experience);
	
	ps.setString(4, skill);
	ps.setString(5, salary);
	ps.setString(6, job_description);
	
	
	
	int x=ps.executeUpdate();
	
	if(x>0){
		System.out.println("job posted successfully");
		%><script>
		   alert("job posted successfully");
		   window.location= "postjob.html";
		</script><%
	}
	else{
		System.out.println("job post failed");
		%><script>
		   alert(" job post failed");
		   window.location= "postjob.html";
		</script><%
	}
	
	
}catch(SQLException e){
	e.printStackTrace();
}



%>
