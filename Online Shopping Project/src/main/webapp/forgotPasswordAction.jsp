<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String email = request.getParameter("email");
String mobilenumber = request.getParameter("mobilenumber");
String securityQuestion = request.getParameter("securityQuestion");
String answer = request.getParameter("answer");
String newPassword = request.getParameter("newpassword");

try {
	int z = 0;
	Connection con = ConnectionProvider.getCon();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select * from users where email = '" + email + "' and mobilenumber='" + mobilenumber + "' and securityQuestion='" + securityQuestion + "'");
	while(rs.next())
	{
		z=1;
		st.executeUpdate("update users set password = '"+newPassword+"'where email = '" + email + "'");
		response.sendRedirect("forgotPassword.jsp?msg=done");
	}
	if(z==0)
	{
		response.sendRedirect("forgotPassword.jsp?msg=invalid");
	}

} catch (Exception e) {
	System.out.print("jsp page " + e);
	
}
%>