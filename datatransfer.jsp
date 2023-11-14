<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="java.sql.*"
    
    %>

<%

String firstname=request.getParameter("firstname");
String lastname=request.getParameter("lastname");
String email=request.getParameter("email");
String category=request.getParameter("category");
String qualification=request.getParameter("qualification");
String gender=request.getParameter("gender");
String age=request.getParameter("age");
String reference=request.getParameter("reference");
String resume=request.getParameter("resume");

try{
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/getwings", "root", "root");
	
	PreparedStatement ps=conn.prepareStatement("insert into personal_info (firstname, lastname, email, category, qualification, gender, age, reference, resume )values(?,?,?,?,?,?,?,?,?)");
	ps.setString(1, firstname);
	ps.setString(2, lastname);
	ps.setString(3, email);
	
	ps.setString(4, category);
	ps.setString(5, qualification);
	ps.setString(6, gender);
	
	ps.setString(7, age);
	ps.setString(8, reference);
	ps.setString(9, resume);
	
	int x=ps.executeUpdate();
	
	if(x>0){
		System.out.println("Database updated successfully");
		%><script>
		   alert("DataBase updated successfully");
		   window.location= "personal_info.html";
		</script><%
	}
	else{
		System.out.println("Database update failed");
		%><script>
		   alert("DataBase updation failed");
		   window.location= "personal_info.html";
		</script><%
	}
	
	
}catch(SQLException e){
	e.printStackTrace();
}



%>
